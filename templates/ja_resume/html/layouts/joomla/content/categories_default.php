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

defined('_JEXEC') or die;

?>

<?php if ($displayData->params->get('show_page_heading')) : ?>
<div class="page-header clearfix">
	<h1>
		<?php echo $displayData->escape($displayData->params->get('page_heading')); ?>
	</h1>
</div>
<?php endif; ?>

<?php if ($displayData->params->get('show_base_description')) : ?>
	<?php //If there is a description in the menu parameters use that; ?>
		<?php if($displayData->params->get('categories_description')) : ?>
			<div class="category-desc base-desc">
			<?php echo JHtml::_('content.prepare', $displayData->params->get('categories_description'), '',  $displayData->get('extension') . '.categories'); ?>
			</div>
		<?php else : ?>
			<?php //Otherwise get one from the database if it exists. ?>
			<?php  if ($displayData->parent->description) : ?>
				<div class="category-desc base-desc">
					<?php echo JHtml::_('content.prepare', $displayData->parent->description, '', $displayData->parent->extension . '.categories'); ?>
				</div>
			<?php endif; ?>
		<?php endif; ?>
	<?php endif; ?>
