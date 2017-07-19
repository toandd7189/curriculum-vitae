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

<?php
	$count 						= $helper->getRows('data.position');
	$module_style 		= 't3xhtml';
?>

<div class="acm-spotlight">
	<?php if($helper->get('acm-title')): ?>
	<h3 class="acm-title"><span><?php echo $helper->get('acm-title') ?></span></h3>
  <?php endif; ?>

  <?php if($helper->get('acm-desc')): ?>
	<div class="acm-desc row"><p class="col-md-6"><?php echo $helper->get('acm-desc') ?></p></div>
  <?php endif; ?>
  
	<div class="row">
	<?php 
		for ($i=0; $i<$count; $i++) : 
		$screensXs = $helper->get('data.xs',$i);
		$screensSm = $helper->get('data.sm',$i);
		$screensMd = $helper->get('data.md',$i);
		$screensLg = $helper->get('data.lg',$i);
	?>
	<div class="<?php echo $screensXs.' '.$screensSm.' '.$screensMd.' '.$screensLg; ?> <?php if($i==($count-1)) echo 'last-col'; ?>">
		<?php
			$spotlight_position = $helper->get('data.position',$i);
		 	echo $helper->renderModules($spotlight_position,array('style'=>$module_style));
		?>
	</div>
	<?php endfor; ?>
	</div>
</div>