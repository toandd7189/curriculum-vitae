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
	
	$doc = JFactory::getDocument();
	$doc->addScript (T3_TEMPLATE_URL.'/acm/gallery/js/ekko-lightbox.js');
	
	$col = $helper->get('col') ; 
?>

<div class="acm-gallery style-2 <?php echo $helper->get('animation') ? 'style-scale' : '' ?>">
	<div class="gallery-info">

		<?php if($helper->get('acm-title')): ?>
			<h3 class="acm-title">
				<span><?php echo $helper->get('acm-title') ?></span>
			</h3>
		<?php endif; ?>

		<?php if($helper->get('gallery-link')): ?>
			<a href="<?php echo $helper->get('gallery-link') ?>" title="<?php echo $helper->get('gallery-link-title') ?>"><i class="fa fa-<?php echo $helper->get('gallery-link-icon') ?>"></i><?php echo $helper->get('gallery-link-title') ?></a>
		<?php endif; ?>
	
	</div>
	<div class="isotope-layout">
		<div class="isotope" style="margin: 0 -<?php echo $helper->get('gutter')/2; ?>px">
			
			<div class="item grid-sizer grid-xs-<?php echo $helper->get('colmb'); ?> grid-sm-<?php echo $helper->get('coltb'); ?> grid-md-<?php echo $helper->get('coldt'); ?>"></div>
			
			<?php
				$count = $helper->getRows('gallery.img'); 
			 ?>
			 
			 <?php for ($i=0; $i<$count; $i++) : ?>
			 <?php $itemsize = $helper->get('gallery.selectitem', $i) ; ?>
				<?php if($helper->get ('gallery.img', $i)):?>
					<div class="item item-<?php echo $itemsize; ?> grid-xs-<?php echo $helper->get('colmb'); ?> grid-sm-<?php echo $helper->get('coltb'); ?> grid-md-<?php echo $helper->get('coldt'); ?>" style="padding: 0 <?php echo $helper->get('gutter')/2; ?>px <?php echo $helper->get('gutter'); ?>px;">
						<div class="item-image">
							<a href="<?php echo $helper->get ('gallery.img', $i) ?>" data-parent=".isotope"  data-toggle="lightbox" data-gallery="gallery" >
								<img class="<?php echo $helper->get('animation') ?> ja-animate" data-animation="flip" data-delay="item-<?php echo $i ?>" src="<?php echo $helper->get ('gallery.img', $i) ?>" alt=" " >
								<?php if($helper->get ('gallery.title', $i) || $helper->get ('gallery.desc', $i)) : ?>
								<span class="mask"></span>
								<?php endif ; ?>
							</a>
						</div>
						<?php if($helper->get ('gallery.title', $i) || $helper->get ('gallery.desc', $i)) : ?>
						<div class="item-image-content">
							<?php if($helper->get ('gallery.title', $i)) : ?>
							<h3 class="title"><a href="<?php echo $helper->get ('gallery.img', $i) ?>"><?php echo $helper->get ('gallery.title', $i) ?></a></h3>
							<?php endif; ?>
							<?php if($helper->get ('gallery.desc', $i)) : ?>
							<p class="desc"><a href="<?php echo $helper->get ('gallery.img', $i) ?>"><?php echo $helper->get ('gallery.desc', $i) ?></a></p>
							<?php endif; ?>
						</div>
						<?php endif; ?>
					</div>
				<?php endif ; ?>
			<?php endfor ?>
			
		</div>

		<?php if($helper->get('text-1')): ?>
			<div class="caption">
				<p><?php echo $helper->get('text-1') ?></p>
			</div>
		<?php endif ;?>
	</div>
</div>