<?php
/**
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

defined('JPATH_BASE') or die;

$canEdit = $displayData['params']->get('access-edit');

?>

<?php if (empty($displayData['print'])) : ?>

	<?php if ($canEdit || $displayData['params']->get('show_print_icon') || $displayData['params']->get('show_email_icon')) : ?>
		<div class="btn-group pull-right">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="fa fa-cog"></span> <span class="caret"></span> </a>
			<?php // Note the actions class is deprecated. Use dropdown-menu instead. ?>
			<ul class="dropdown-menu">
				<?php if ($displayData['params']->get('show_print_icon')) : ?>
					<li class="print-icon"> <?php echo JHtml::_('icon.print_popup', $displayData['item'], $displayData['params']); ?> </li>
				<?php endif; ?>
				<?php if ($displayData['params']->get('show_email_icon')) : ?>
					<li class="email-icon"> <?php echo JHtml::_('icon.email', $displayData['item'], $displayData['params']); ?> </li>
				<?php endif; ?>
				<?php if ($canEdit) : ?>
					<li class="edit-icon"> <?php echo JHtml::_('icon.edit', $displayData['item'], $displayData['params']); ?> </li>
				<?php endif; ?>
			</ul>
		</div>
	<?php endif; ?>

<?php else : ?>

	<div class="pull-right">
		<?php echo JHtml::_('icon.print_screen', $displayData['item'], $displayData['params']); ?>
	</div>

<?php endif; ?>
