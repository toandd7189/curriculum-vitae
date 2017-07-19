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

$path = dirname(dirname(dirname(dirname(__FILE__))));
 
require_once ( JPATH_BASE .'/includes/defines.php' );
require_once ( JPATH_BASE .'/includes/framework.php' );
$mainframe = JFactory::getApplication('site');
$mainframe->initialise();

$sessionjson = JFactory::getSession();
$sessionjson->set('verify_security_json', md5(time()));
?>
<?php if ($status!=''):?>
<script type="text/javascript">
	alert('<?php echo $status;?>');
</script>
<?php endif;?>
<div id="<?php echo $params->get('moduleclass_sfx','')?>ja-form" class="<?php echo $params->get('jastyle','style1'); ?>">
	<div class="<?php echo $params->get('moduleclass_sfx','')?>form-info">
		<h3><?php echo $params->get('intro_text', JText::_('CONTACT_US'))?></h3>
	</div>
	<form  action="#" name="ja_quicks_contact" method="post" id="ja_quicks_contact" class="form-validate">
		<ul class="<?php echo $params->get('moduleclass_sfx','')?>form-list">
			<li class="<?php echo $params->get('moduleclass_sfx','')?>wide clearfix" id="row_name">
				<label for="contact_name" class="required">
					&nbsp;<?php echo $senderlabel;?>:
				</label>
				<div class="<?php echo $params->get('moduleclass_sfx','')?>input-box">
					<div id="error_name" class="<?php echo $params->get('moduleclass_sfx','')?>jl_error"><?php if(isset($error['name']))echo $error['name'] ?></div>
					<input  id="contact_name" type="text" name="name" value="<?php if ($name!='')echo $name; else echo ''; ?>" maxlength="60" size="40" />  
				</div>
			</li>
			<li class="<?php echo $params->get('moduleclass_sfx','')?>wide clearfix" id="row_email">
				<label id="contact_emailmsg" for="contact_email">
				&nbsp;<?php echo $email_label?>:
				</label>
				<div class="<?php echo $params->get('moduleclass_sfx','')?>input-box">
					<div id="error_email" class="<?php echo $params->get('moduleclass_sfx','')?>jl_error"><?php if(isset($error['email']))echo $error['email'] ?></div>
					<input class="input-text" id="contact_email" type="text" name="email" value="<?php if ($email!='')echo $email; else echo ''; ?>" maxlength="64" size="40" />  
					<div class="<?php echo $params->get('moduleclass_sfx','')?>small"><?php echo JText::_('NOTICE_REQUEST_USER_REAL_EMAIL');?> </div>
				</div>
			</li>
			<li class="<?php echo $params->get('moduleclass_sfx','')?>wide clearfix" id="row_subject">
				<label id="contact_subjectmsg" class="required" for="contact_subject">
					&nbsp;<?php echo $subject_label?>:
				</label>
				<div class="<?php echo $params->get('moduleclass_sfx','')?>input-box">
					<div id="error_subject" class="<?php echo $params->get('moduleclass_sfx','')?>jl_error"><?php if(isset($error['error_subject']))echo $error['error_subject'] ?></div>
					<input class="input-text" id="contact_subject" name="subject"  value="<?php echo @$subject?>"  size="40"/>
				</div>
			</li>
			<li class="<?php echo $params->get('moduleclass_sfx','')?>wide clearfix" id="row_text">
				<label id="contact_textmsg" class="required" for="contact_text">
					&nbsp;<?php echo $message_label?>:
				</label>
				<div class="<?php echo $params->get('moduleclass_sfx','')?>input-box">
					<div id="error_text" class="<?php echo $params->get('moduleclass_sfx','')?>jl_error"><?php if(isset($error['error_text']))echo $error['error_text'] ?></div>
					<textarea class="textarea" id="contact_text" name="text" rows="10" cols="40" ><?php if($text!='') echo $text; else echo ''?></textarea>
				</div>
			</li>
			<?php if ($params->get( 'show_email_copy' ,0)) : ?>
			<li class="<?php echo $params->get('moduleclass_sfx','')?>wide">
				<div class="<?php echo $params->get('moduleclass_sfx','')?>input-box">
					<input type="checkbox" name="email_copy" id="contact_email_copy" value="1"  />
					<label for="contact_email_copy">
					<?php echo JText::_( 'SEND_ME_A_COPIED_EMAIL' ); ?>
					</label>
				</div>
			</li>
			<?php endif; ?>
			
			<?php if ($captcha):
				$cp_plugin = JPluginHelper::getPlugin('content', 'captcha');
				$cp_plgParams = new JRegistry($cp_plugin->params);
				$cp_version = $cp_plgParams->get('version', '');
				$sitekey = $cp_plgParams->get('captcha_systems-recaptcha-PubKey' , '');
				// use recaptcha params if we do not have all data we need.
				if ($cp_plgParams->get('captcha_systems') == 'recaptcha') {
					if ($cp_version == '' || $sitekey == '') { // in case just update do not have version.
						$_cp_plugin = JPluginHelper::getPlugin('captcha', 'recaptcha');
						if ($_cp_plugin) $cp_plugin=$_cp_plugin; // override content captcha to recaptcha.
						$cp_plgParams = new JRegistry($cp_plugin->params); // redeclare plugin params.
						$cp_version = $cp_plgParams->get('version', '1.0');
						$sitekey = $cp_plgParams->get('public_key', '');
					}
				} else $cp_version='1.0'; // set to 1.0 if not recaptcha.

				if($cp_version == '2.0'): ?>
				<script src="https://www.google.com/recaptcha/api.js"></script>
					<li class="<?php echo $params->get('moduleclass_sfx','')?>wide">
							<div class="g-recaptcha" data-sitekey="<?php echo $sitekey; ?>"></div>
							<div id="error_captcha_code" class="<?php echo $params->get('moduleclass_sfx','')?>jl_error"><?php if(isset($error['captcha_code']))echo $error['captcha_code'] ?></div>
					</li>
				<?php elseif($cp_version == '1.0'): ?>
					<li class="<?php echo $params->get('moduleclass_sfx','')?>wide" style="margin-top: 10px;">
						<div class="<?php echo $params->get('moduleclass_sfx','')?>input-box">
						<div id="error_captcha_code" class="<?php echo $params->get('moduleclass_sfx','')?>jl_error"><?php if(isset($error['captcha_code']))echo $error['captcha_code'] ?></div>
					<?php
						$mainframe->triggerEvent('onAfterDisplayForm');
					?>
						</div>
					</li>
				<?php endif; ?>
			<?php endif;?>
			
			<li>
				<div style="padding-top: 10px;">
					<a href="javascript:void(0)" id="ac-submit" class="button-img but-orange"><span class="icon icon-submit">&nbsp;</span><span><?php echo JText::_("SEND_EMAIL"); ?></span></a> 
				</div>
			</li>
		</ul>
		<input type="hidden" name="category" value="Error/Problems using site" />
		<input type="hidden" name="do_submit" value="1" />
		<?php echo JHTML::_( 'form.token' ); ?>
	</form>
</div>
<script type="text/javascript">
/* <![CDATA[ */
	var captcha_code = 0;
	maxchars = <?php echo $params->get('max_chars',1000);?>;
	captcha = <?php echo intval($captcha)?>;
	var emailabel = '<?php echo $email_label?>';
	var senderlabel = '<?php echo $senderlabel?>';
	var messagelabel = '<?php echo $message_label?>';
	window.addEvent('load', function(){
		el = $('ac-submit');
		$("ja_quicks_contact").reset();
	el.onclick = function()
	{
		if ($("system-message")) {
			$("system-message").innerHTML = '';
		}
		var email = $('contact_email').value;
		var ck=true;
		var errors = $$('.error');
		if (!errors || errors.length>0)
		{
			errors.removeClass('error');
		}
		regex=/^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z0-9.-]{2,4}$/;
		if(!regex.test(email))
		{
			if((email=='')||(email==emailabel))
			{
				$('error_email').innerHTML ='<?php echo JText::_('ERROR_EMAIL_EMPTY')?>';
			}
			else
			{
				$('error_email').innerHTML ="<?php echo JText::_('ERROR_EMAIL_INVALID')?>";
			}
			$('row_email').addClass('error');
			ck=false;
		}
		else
		{
			$('error_email').innerHTML ='';
		}
		var name = $('contact_name').value;
		if((name=='')||(name==senderlabel))
		{
			$('error_name').innerHTML ='<?php echo  JText::_("ERROR_NAME_INVALID")?>';
			$('row_name').addClass('error');
			ck = false;
		}
		else
		{
			$('error_name').innerHTML ='';
		}
		var subject = $('contact_subject').value;
		if(subject=='')
		{
			$('error_subject').innerHTML ="<?php echo  JText::_("SUBJECT_REQUIRE")?>";
			$('row_subject').addClass('error');
			ck = false;
		}
		else
		{
			$('error_subject').innerHTML ='';
		}
		var message = $('contact_text').value;
		if((message.length>maxchars) ||(message.length < 5)||(message==messagelabel))
		{
			
			$('error_text').innerHTML ='<?php $error_message = JText::_('ERROR_MESSAGE_INVALID').$params->get('max_chars','5'); echo addslashes($error_message);?>';
			$('row_text').addClass('error');
			ck = false;
		}
		else
		{
			$('error_text').innerHTML ='';
		}
		if(captcha)
		{
			<?php if($cp_version && $cp_version == '1.0') : ?>
				if ($('captcha_code')){
					var captcha_code = $('captcha_code').value;
					if((captcha_code=='')||(captcha_code=='Type the code shown'))
					{
						$('error_captcha_code').innerHTML = "<?php echo JText::_('EMPTY_CAPTCHA')?>";
						ck = false;
					} else 
						$('error_captcha_code').innerHTML = "";
				} else if($('recaptcha_response_field')){
					var captcha_code = $('recaptcha_response_field').value;
					if((captcha_code=='')||(captcha_code=='Type the code shown'))
					{
						$('error_captcha_code').innerHTML = "<?php echo JText::_('EMPTY_CAPTCHA')?>";
						ck = false;
					} else 
						$('error_captcha_code').innerHTML = "";
				} else if ($('mathguard_answer')) {
					var captcha_code = $('mathguard_answer').value;
					console.log(captcha_code);
					if((captcha_code=='')||(captcha_code=='Type the code shown'))
					{
						$('error_captcha_code').innerHTML = "<?php echo JText::_('EMPTY_CAPTCHA')?>";
						ck = false;
					} else 
						$('error_captcha_code').innerHTML = "";
				}
			<?php elseif($cp_version == '2.0') : ?>
				var response = grecaptcha.getResponse();
				//recaptcha failed validation
				if(response.length == 0){
					$('error_captcha_code').innerHTML = "<?php echo JText::_('EMPTY_CAPTCHA')?>";
					ck = false;
				}else $('error_captcha_code').innerHTML = "";        
			<?php endif; ?>
		}
		
		if(ck)
		{
			if ($("contact_email_copy")) {
				email_copy_check = document.getElementById("contact_email_copy").checked;
			} else {
				email_copy_check = 0;
			}
			send_email_ajax(captcha_code);
		}
		return ck;
	};
});
/* ]]> */
</script>

<script type="text/javascript">
/* <![CDATA[ */
function send_email_ajax(captcha_code)
{
	var text_rep = $("contact_text").value.replace(new RegExp( "\\n", "g" ),"~");
	var xurl = "<?php echo JURI::base();?>modules/<?php echo $module->module; ?>/admin/helper.php?japaramaction=sendEmail";
	var recaptcha_response_field = '';
	if($("recaptcha_response_field")){
		recaptcha_response_field = $("recaptcha_response_field").value;
	}
	var recaptcha_challenge_field = '';
	if($("recaptcha_challenge_field")){
		recaptcha_challenge_field = $("recaptcha_challenge_field").value;
	}
	var email_copy = 0;
	if($("contact_email_copy")){
		if($("contact_email_copy").checked){
			email_copy = $("contact_email_copy").value;
		}
	}
	
	var request = {"email_copy":email_copy,"name":$("contact_name").value,"email":$("contact_email").value,"subject":$("contact_subject").value,"text":text_rep,"captcha":captcha_code,"jsondata":"<?php echo $sessionjson->get('verify_security_json')?>","recaptcha_response_field":recaptcha_response_field,"recaptcha_challenge_field":recaptcha_challenge_field};
	<?php if($cp_version && $cp_version == '2.0') : ?>
		var response = grecaptcha.getResponse();
		//recaptcha failed validation
		if(response.length != 0){
			request['g-recaptcha-response'] = 1;
		}
	<?php endif; ?>
	var jSonRequest = new Request.JSON({url:xurl, onComplete: function(result){
				requesting = false;
				contentHTML="";
				if (result.successful) {
					contentHTML += "<dd class=\"success message\"><ul><li>"+result.successful+"</li></ul></dd>";
					$("ac-submit").addClass("sm");
					$("ac-submit").disabled="disabled";

					$('contact_name').value = '';
					$('contact_email').value = '';
					$('contact_subject').value = '';
					$('contact_text').value = '';
					if($("captcha")){
						var myURI = new URI($("captcha").get('src'));
						$('captcha').set('src',myURI+'?sid=<?php echo md5(time());?>');
						$('captcha_code').value = '';
					}
					if($("recaptcha_image")){
						Recaptcha.reload();
					}
				}
				if (result.error) {
					contentHTML += "<dd class=\"error message\"><ul><li>"+result.error+"</li></ul></dd>";
					if($("captcha")){
						var myURI = new URI($("captcha").get('src'));
						$('captcha').set('src',myURI+'?sid=<?php echo md5(time());?>');
						$('captcha_code').value = '';
					}
					if($("recaptcha_image")){
						Recaptcha.reload();
					}
				}
				var msgobj = null;
				if (!$("system-message")) {
					msgobj = new Element('dl', {'id': 'system-message'}).inject(new Element('div', {'id': 'system-message-container'}).inject($('ja-form').getElement('.form-info')));
				}
				else{
					msgobj = $("system-message");
				}
				
				
				msgobj.innerHTML = contentHTML;
			}
	}).post(request);
	
}
/* ]]> */
</script>