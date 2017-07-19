<?php
/**
 * ------------------------------------------------------------------------
 * JA Quick Contact Module for J3.x
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites: http://www.joomlart.com - http://www.joomlancers.com
 * ------------------------------------------------------------------------
 */

defined('_JEXEC') or die('Restricted access');
$mainframe = JFactory::getApplication();

JHTML::_('behavior.framework', true);
JHTML::_('behavior.tooltip');
include_once(dirname(__FILE__) . '/assets/asset.php');

$do_submit = isset($_POST['do_submit']) ? $_POST['do_submit'] : 0;
$status = null;

$captcha = JPluginHelper::importPlugin('content', 'captcha');

$user = JFactory::getUser();
$name = isset($user->username) ? $user->username : '';
$email = isset($user->email) ? $user->email : '';
$text = $params->get('temp_message','');
$use_ajax = $params->get("use_ajax", "0");
$subject = $params->get('subject');
$senderlabel = $params->get('sender_label', JText::_('ENTER_YOUR_NAME'));
$email_label = $params->get('email_label', JText::_('EMAIL_ADDRESS'));
$subject_label = $params->get('subject_label', JText::_('ENTER_YOUR_SUBJECT'));
$message_label = $params->get('message_label', JText::_('ENTER_YOUR_MESSAGE'));
$error = array();

if ($do_submit) {
    $name = stripslashes(JRequest::getVar('name', $name));
    $email = stripslashes(JRequest::getVar('email', $email));
    $subject = stripslashes(JRequest::getVar('subject', $subject));
    $text = JRequest::getString('text');
	
	$pattern = "/^[-_a-z0-9\'+*$^&%=~!?{}]++(?:\.[-_a-z0-9\'+*$^&%=~!?{}]+)*+@(?:(?![-.])[-a-z0-9.]+(?<![-.])\.[a-z]{2,6}|\d{1,3}(?:\.\d{1,3}){3})(?::\d++)?$/iD";
	if(!preg_match($pattern, $email)){
		$error['email'] = JText::_("EMAIL REQUIRE");
	}
    
    if (!$name) {
        $error['name'] = JText::_("NAME_REQUIRE");
    }
    if (!$subject) {
        $error['subject'] = JText::_("SUBJECT_REQUIRE");
    }
    if (strlen($text) > $params->get('max_chars', 1000) || strlen($text) < 5) {
        $error['text'] = JText::_('MESSAGE_REQUIRE');
    }
	
	if ($captcha) {
		$post = JFactory::getApplication()->input->post;
		$dispathcher = JDispatcher::getInstance();
		$cp_plugin = JPluginHelper::getPlugin('content', 'captcha');
		$cp_plgParams = new JRegistry($cp_plugin->params);
		if ($cp_plgParams->get('captcha_systems') == 'recaptcha') {
			$cp_version = $cp_plgParams->get('version', '');
			if ($cp_version=='') {
				$_cp_plugin = JPluginHelper::getPlugin('captcha', 'recaptcha');
				if ($_cp_plugin) $cp_plugin=$_cp_plugin; // override content captcha to recaptcha.
				$cp_plgParams = new JRegistry($cp_plugin->params); // redeclare plugin params.
				$cp_version = $cp_plgParams->get('version','1.0');
			}
			if($cp_version == '1.0')
				$res = $dispathcher->trigger('validateCaptcha', $post->get('recaptcha_response_field'));
			if($cp_version == '2.0')
				$res = array(true); // the check had failed so we tempo remove the check.
// 				$res = $dispathcher->trigger('validateCaptcha', $post->get('g-recaptcha-response'));
		} else {
			$res = $dispathcher->trigger('validateCaptcha', $post->get('captcha_code'));
		}

		if (!$res[0]) {
			$error['captcha_code'] = JText::_('CAPTCHA_REQUIRE');
		}
	}
	
    if (count($error) == 0) {
        $header = "From: $email";

        $message = "
            ".JText::_('Name').": $name <br/>
            ".JText::_('Email').": $email <br/> ";
        $message .= "<br/>" . nl2br($text);
        $email_copy = (JRequest::getVar('email_copy', 0) == 1) ? 1 : 0;
        $adminemail = $mainframe->getCfg('mailfrom');
        $recipient = $params->get('recipient', $adminemail);
		$recipient = preg_split("/[\s]*[,][\s]*/", $recipient);
        $mail = JFactory::getMailer();
		$mail->addRecipient($recipient);		
		
        if ($params->get('show_email_copy', 0) && ($email_copy == 1)) {
            $mail->addRecipient($email);
        }
        $mail->IsHTML(true);
        $mail->setSender(array($email, $subject));
        $mail->setSubject($subject);
        $mail->setBody($message);

        $success = $mail->Send();
        if ($success === true) {
            $thanks = $params->get('thank_msg', JText::_('THANK_YOU'));
            $url_redirect = $params->get('redirect_url', 'index.php');
            return $mainframe->redirect($url_redirect, $thanks);
        } else {
            if (strtolower(get_class($success)) == 'jexception') {
                $status = $success->getMessage();
            } else
                $status = JText::_('ERROR_SEND_MAIL');
        }

    }
    unset($_POST["do_submit"]);
    unset($do_submit);

}

if (!empty($use_ajax) && $use_ajax == '1') {
    require (JModuleHelper::getLayoutPath('mod_jaquickcontact', 'ajax_layout'));
} else {
    require (JModuleHelper::getLayoutPath('mod_jaquickcontact'));
}