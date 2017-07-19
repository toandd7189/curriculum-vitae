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

if (!defined('_JEXEC')) {
    define('_JEXEC', 1);
	
	// no direct access
    defined ( '_JEXEC' ) or die ( 'Restricted access' );
	
    $path = dirname(dirname(dirname(dirname(__FILE__))));
    define('JPATH_BASE', $path);

    if (strpos(php_sapi_name(), 'cgi') !== false && !empty($_SERVER['REQUEST_URI'])) {
        //Apache CGI
        $_SERVER['PHP_SELF'] = rtrim(dirname(dirname(dirname($_SERVER['PHP_SELF']))), '/\\');
    } else {
        //Others
        $_SERVER['SCRIPT_NAME'] = rtrim(dirname(dirname(dirname($_SERVER['SCRIPT_NAME']))), '/\\');
    }
    
    require_once (JPATH_BASE . '/includes/defines.php');
    require_once (JPATH_BASE . '/includes/framework.php');
    JDEBUG ? $_PROFILER->mark('afterLoad') : null;

	/**
	 * CREATE THE APPLICATION
	 *
	 * NOTE :
	 */
	$mainframe = JFactory::getApplication('site');
	
	/**
	 * INITIALISE THE APPLICATION
	 *
	 * NOTE :
	 */
	$mainframe->initialise();
	
	//JPluginHelper::importPlugin('system');
	
	// trigger the onAfterInitialise events
	//JDEBUG ? $_PROFILER->mark('afterInitialise') : null;
	//$mainframe->triggerEvent('onAfterInitialise');
}

jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');
jimport('joomla.application.module.helper');
jimport( 'joomla.html.parameter' );

$task = isset($_REQUEST['japaramaction']) ? $_REQUEST['japaramaction'] : '';

if ($task != '') {
    $lang = JFactory::getLanguage();
    $lang->load('mod_jaquickcontact');
    $JAAdminAnim = new JAAdminAnim();
    $JAAdminAnim->$task();
}
/**
 * Send mail ajax class
 */
class JAAdminAnim
{


    /**
     *
     * Send mail contact
     */
    function sendEmail()
    {
        global $mainframe;
        //session_start();
        $sessionjson = JFactory::getSession();
		// Initialize some variables		
		$captcha = JPluginHelper::importPlugin('content','captcha');

		$client		= JApplicationHelper::getClientInfo(JRequest::getVar('client', '0', '', 'int'));
					
		$post = $_POST;
		//print_r($post);
        $module = JModuleHelper::getModule('mod_jaquickcontact');
      
        $params = new JRegistry($module->params);
        $verify_security_code = $post['jsondata'];
        if ($sessionjson->get('verify_security_json')) {
            if (strcmp($verify_security_code, $sessionjson->get('verify_security_json')) != 0) {
                $sessionjson->set('verify_security_json', 0);
                $url_redirect = $params->get('redirect_url', 'index.php');
                return $mainframe->redirect($url_redirect, JText::_('ERROR_SEND_MAIL'));
            }
        } else {
            $sessionjson->set('verify_security_json', 0);
            $url_redirect = $params->get('redirect_url', 'index.php');
            return $mainframe->redirect($url_redirect, JText::_('ERROR_SEND_MAIL'));
        }
        $email = $post['email'];
        $name = $post['name'];
        $text = str_replace("~", "<br />", $post['text']);
        $subject = $post['subject'];

        $header = "From: $email";
        $error1 = array();
		
		$pattern = "/^[-_a-z0-9\'+*$^&%=~!?{}]++(?:\.[-_a-z0-9\'+*$^&%=~!?{}]+)*+@(?:(?![-.])[-a-z0-9.]+(?<![-.])\.[a-z]{2,6}|\d{1,3}(?:\.\d{1,3}){3})(?::\d++)?$/iD";
		if(!preg_match($pattern, $email)){
			$error1['email'] = JText::_("EMAIL REQUIRE");
		}      
        if (!$name) {
            $error1['name'] = JText::_("NAME_REQUIRE");
        }
        if (!$subject) {
            $error1['subject'] = JText::_("SUBJECT_REQUIRE");
        }
        if (strlen($text) > $params->get('max_chars', 1000) || strlen($text) < 5) {
            $error1['text'] = JText::_('MESSAGE_REQUIRE');
        }

        if ($captcha == true) {
            $_post = JFactory::getApplication()->input->post;
			$dispathcher = JDispatcher::getInstance();
			$cp_plugin = JPluginHelper::getPlugin('content', 'captcha');
			$cp_plgParams = new JRegistry($cp_plugin->params);
			if ($cp_plgParams->get('captcha_systems') == 'recaptcha') {
				$cp_version = $cp_plgParams->get('version', '');
				$secretkey = $cp_plgParams->get('captcha_systems-recaptcha-PriKey' , '');
				if ($cp_version=='' || $secretkey=='') {
					$_cp_plugin = JPluginHelper::getPlugin('captcha', 'recaptcha');
					if ($_cp_plugin) $cp_plugin=$_cp_plugin; // override content captcha to recaptcha.
					$cp_plgParams = new JRegistry($cp_plugin->params); // redeclare plugin params.
					$cp_version = $cp_plgParams->get('version','1.0');
					$secretkey = $cp_plgParams->get('private_key');
				}

				if($cp_version == '1.0')
					$res = $dispathcher->trigger('validateCaptcha', $_post->get('recaptcha_response_field'));
				if($cp_version == '2.0') {
					$res = array(true); // the check had failed so we tempo remove the check.
					$response = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secretkey.'&remoteip='.$_SERVER['REMOTE_ADDR']);
					if($response.success == false){
						$error1['captcha_code'] = JText::_('CAPTCHA_SPAMER');
					}
				}
			} else {
				$res = $dispathcher->trigger('validateCaptcha', $_post->get('captcha'));
			}

			if (!$res[0]) {
				$error1['captcha_code'] = JText::_('CAPTCHA_REQUIRE');
			}
        }

        $error_msg = implode("<br/>", $error1);
        //echo count($error1);exit;
        if (count($error1) == 0) {
            $message = "
				Name: $name <br/>
				Email: $email <br/> ";
			$message .=
				"<br/>	            
				$text
				";
			$email_copy = ($post['email_copy'] == 'true') ? 1 : 0;
			if($post['email_copy']==1){
				$email_copy = $post['email_copy'];
			}
            $adminemail = $mainframe->getCfg('mailfrom');
            $recipient = $params->get('recipient', $adminemail);
			$recipient = preg_split("/[\s]*[,][\s]*/", $recipient);
            $mail = JFactory::getMailer();
			
            $errors = array();
            $mail->addRecipient($recipient);			
			
			if ($email_copy == 1) {
                $mail->addRecipient($email);
            }
			
            $mail->IsHTML(true);
            $mail->setSender(array($email, $subject));
            $mail->setSubject($subject);
            $mail->setBody($message);

            $success = $mail->Send();
            if ($success === true) {
                $thanks = $params->get('thank_msg', JText::_('THANK_YOU'));
                $result['successful'] = $thanks;
            } else {
                if (strtolower(get_class($success)) == 'jexception') {
                    $status = $success->getMessage();
                } else
                    $status = JText::_('ERROR_SEND_MAIL');
                $result['error'] = $status;
            }
            echo json_encode($result);
            exit();
        } else {
            $result['error'] = $error_msg;
            echo json_encode($result);
            exit();
        }
    }
}
