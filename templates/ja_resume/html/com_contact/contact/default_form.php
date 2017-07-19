<?php
/*
 * ------------------------------------------------------------------------
 * JA Resume Template
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - Copyrighted Commercial Software
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites:  http://www.joomlart.com -  http://www.joomlancers.com
 * This file may not be redistributed in whole or significant part.
 * ------------------------------------------------------------------------
*/

defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('behavior.formvalidation');

$regex = '@class="([^"]*)"@';
$lbreg = '@" class="([^"]*)"@';
$label = 'class="$1 control-label"';
$input = 'class="$1 form-control"';

if (isset($this->error)) : ?>
	<div class="contact-error">
		<?php echo $this->error; ?>
	</div>
<?php endif; ?>

<div class="contact-form">
	<form id="contact-form" action="<?php echo JRoute::_('index.php'); ?>" method="post" class="form-validate form-horizontal">
		<fieldset>
			<legend><?php echo JText::_('COM_CONTACT_FORM_LABEL'); ?></legend>
			<div class="form-group">
				<div class="col-sm-12 contact-name">
					<?php echo preg_replace($regex, $label, $this->form->getLabel('contact_name'), 1); ?>
					<?php echo preg_replace($regex, $input, $this->form->getInput('contact_name')); ?>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12 contact-email">
					<?php echo preg_replace($regex, $label, $this->form->getLabel('contact_email'), 1); ?>
					<?php echo preg_replace($regex, $input, $this->form->getInput('contact_email')); ?>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-12">
					<?php echo preg_replace($regex, $label, $this->form->getLabel('contact_subject'), 1); ?>
					<?php echo preg_replace($regex, $input, $this->form->getInput('contact_subject')); ?>
				</div>
			</div>
			<div class="form-group contact-mes">
				<div class="col-sm-12">
					<?php echo preg_replace($regex, $label, $this->form->getLabel('contact_message'), 1); ?>
					<?php echo preg_replace($regex, $input, $this->form->getInput('contact_message')); ?>
				</div>
			</div>
			<?php //Dynamically load any additional fields from plugins. ?>
			<?php foreach ($this->form->getFieldsets() as $fieldset) : ?>
				<?php if ($fieldset->name != 'contact'):?>
					<?php $fields = $this->form->getFieldset($fieldset->name);?>
					<?php foreach ($fields as $field) : ?>
						<div class="form-group">
							<div class="col-sm-12">
								<?php if ($field->hidden) : ?>
									<?php echo $field->input;?>
								<?php else:?>
									<?php echo preg_replace($lbreg, '" ' . $label, $field->label); ?>
									<div class="form_captcha">
									<?php if (!$field->required && $field->type != "Spacer") : ?>
										<span class="optional"><?php echo JText::_('COM_CONTACT_OPTIONAL');?></span>
									<?php endif; ?>
									<?php echo $field->input;?>
									</div>
								<?php endif;?>
							</div>
						</div>
					<?php endforeach;?>
				<?php endif ?>
			<?php endforeach;?>
			<div class="form-group">
				<div class="col-sm-12 control-btn">
					<?php if ($this->params->get('show_email_copy')) { ?>
						<div class="checkbox">
							<?php echo $this->form->getInput('contact_email_copy'); ?>
							<?php echo $this->form->getLabel('contact_email_copy'); ?>
						</div>
					<?php } ?>
					<button class="btn btn-primary validate" type="submit"><?php echo JText::_('COM_CONTACT_CONTACT_SEND'); ?></button>
				</div>
				
				<input type="hidden" name="option" value="com_contact" />
				<input type="hidden" name="task" value="contact.submit" />
				<input type="hidden" name="return" value="<?php echo $this->return_page;?>" />
				<input type="hidden" name="id" value="<?php echo $this->contact->slug; ?>" />
				<?php echo JHtml::_('form.token'); ?>
			</div>
		</fieldset>
	</form>
</div>
