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

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers');
JHtml::addIncludePath(T3_PATH.'/html/com_content');
JHtml::addIncludePath(dirname(dirname(__FILE__)));
JHtml::_('behavior.caption');
?>

<div class="blog<?php echo $this->pageclass_sfx;?>">
	<?php if ($this->params->get('show_page_heading', 1)) : ?>
	<div class="page-header clearfix">
		<h1 class="page-title"> <?php echo $this->escape($this->params->get('page_heading')); ?> </h1>
	</div>
	<?php endif; ?>
	<?php if ($this->params->get('show_category_title', 1) or $this->params->get('page_subheading')) : ?>
  	<div class="page-subheader clearfix">
  		<h2 class="page-subtitle"><?php echo $this->escape($this->params->get('page_subheading')); ?>
			<?php if ($this->params->get('show_category_title')) : ?>
			<small class="subheading-category"><?php echo $this->category->title;?></small>
			<?php endif; ?>
  		</h2>
	</div>
	<?php endif; ?>
	
	<?php if ($this->params->get('show_tags', 1) && !empty($this->category->tags->itemTags)) : ?>
		<?php echo JLayoutHelper::render('joomla.content.tags', $this->category->tags->itemTags); ?>
	<?php endif; ?>
	
	<?php if ($this->params->get('show_description', 1) || $this->params->def('show_description_image', 1)) : ?>
	<div class="category-desc clearfix">
		<?php if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) : ?>
			<img src="<?php echo $this->category->getParams()->get('image'); ?>"/>
		<?php endif; ?>
		<?php if ($this->params->get('show_description') && $this->category->description) : ?>
			<?php echo JHtml::_('content.prepare', $this->category->description, '', 'com_content.category'); ?>
		<?php endif; ?>
	</div>
	<?php endif; ?>

	<div class="ja-masonry-wrap isotope-layout">
		<!-- Load Modules Positions -->
		<?php 
		$ads_modules = 'before-blog';
		$attrs = array();
		$result = null;
		$renderer = JFactory::getDocument()->loadRenderer('modules');
		$modules = $renderer->render($ads_modules, $attrs, $result);

		if ($modules) : ?>
		    <?php echo $modules ?>
		<?php endif ?>
		<!-- Load Modules Positions End -->

		<?php if (empty($this->lead_items) && empty($this->link_items) && empty($this->intro_items)) : ?>
			<?php if ($this->params->get('show_no_articles', 1)) : ?>
				<p class="col-xs-12"><?php echo JText::_('COM_CONTENT_NO_ARTICLES'); ?></p>
			<?php endif; ?>
		<?php endif; ?>
		
		<div id="item-container" class="isotope grid clearfix grid-xs-1 grid-smx-2 grid-sm-3 grid-md-4 grid-lg-4">
			<div class="item grid-sizer"></div>
			<?php $leadingcount = 0; ?>
			<?php if (!empty($this->lead_items)) : ?>
				<?php foreach ($this->lead_items as &$item) : ?>
				<div class="item items-row isotope-item item-1 item-bg-default <?php echo $item->state == 0 ? ' system-unpublished' : null; ?>">
					<?php
						$this->item = &$item;
						echo $this->loadTemplate('item');
					?>
				</div>
				<?php $leadingcount++; ?>
				<?php endforeach; ?>
			<?php endif; ?>

			<?php
				$introcount = (count($this->intro_items));
				$counter = 0;
			?>

			<?php if (!empty($this->intro_items)) : ?>
			<?php foreach ($this->intro_items as $key => &$item) : ?>
				<?php $rowcount = ((int) $counter % (int) $this->columns) + 1; ?>
				<?php if ($rowcount == 1) : ?>
					<?php $row = $counter / $this->columns; ?>
				<?php endif; ?>
						<div class="item items-row isotope-item item-1 item-bg-default column-<?php echo $rowcount;?><?php echo $item->state == 0 ? ' system-unpublished' : null; ?>">
							<?php
							$this->item = &$item;
							echo $this->loadTemplate('item');
						?>
						</div><!-- end item -->
						<?php $counter++; ?>
					<?php if (($rowcount == $this->columns) or ($counter == $introcount)) : ?>			
					<?php endif; ?>
			<?php endforeach; ?>
			<?php endif; ?>

		</div>

	</div>
	
	<?php if (!empty($this->link_items)) : ?>
	<div class="items-more">
	<?php echo $this->loadTemplate('links'); ?>
	</div>
	<?php endif; ?>
	
	<?php if (!empty($this->children[$this->category->id])&& $this->maxLevel != 0) : ?>
	<div class="cat-children">
		<?php if ($this->params->get('show_category_heading_title_text', 1) == 1) : ?>
		<h3> <?php echo JTEXT::_('JGLOBAL_SUBCATEGORIES'); ?> </h3>
		<?php endif; ?>
		<?php echo $this->loadTemplate('children'); ?> </div>
	<?php endif; ?>
	<?php echo JLayoutHelper::render('joomla.content.pagination', array('params'=>$this->params, 'pagination'=>$this->pagination)); ?>

</div>