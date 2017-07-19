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
	$fullWidth 					= $helper->get('full-width');
	$columns						= $helper->get('columns');
	$count 							= $helper->getRows('client-item.client-logo');
	$gray								= $helper->get('img-gray');
	$opacity						= $helper->get('img-opacity');
	$float = 0;
	
	if ($opacity=="") {
		$opacity = 100;
	}
	
	if (100%$columns) {
		$float = 0.01;
	}
	
	$blockImg 				= $helper->get('block-bg');
	$blockImgBg  			= 'background-image: url("'.$blockImg.'"); background-repeat: no-repeat; background-size: cover; background-position: center center;';
	 
?>

<div id="acm-cliens-<?php echo $module->id; ?>" class="acm-cliens style-1 <?php if($gray): ?> img-grayscale <?php endif; ?> <?php if($fullWidth): ?>full-width <?php endif; ?> <?php if($count > $columns): ?> multi-row <?php endif; ?>">
	<div class="acm-intro">
		<span><?php echo $helper->get('acm-intro') ?></span>
	</div>
	 <?php 
	 	for ($i=0; $i<$count; $i++) : 
	 	
		$clientName = $helper->get('client-item.client-name',$i);
		$clientLink = $helper->get('client-item.client-link',$i);
		$clientLogo = $helper->get('client-item.client-logo',$i);
		
		if ($i%$columns==0) echo '<div class="row">'; 
	?>
	
		<div class="col-xs-12 client-item ja-animate" data-animation="pop-up" data-delay="item-<?php echo $i ?>" style="width:<?php echo number_format(100/$columns, 2, '.', ' ') - $float;?>%;">
			<div class="client-img">
				<?php if($clientLink):?><a href="<?php echo $clientLink; ?>" title="<?php echo $clientName; ?>" ><?php endif; ?>
					<img class="img-responsive" alt="<?php echo $clientName; ?>" src="<?php echo $clientLogo; ?>">
				<?php if($clientLink):?></a><?php endif; ?>
			</div>
		</div> 
		
	 	<?php if ( ($i%$columns==($columns-1)) || $i==($count-1) )  echo '</div>'; ?>
	 	
 	<?php endfor ?>

</div>
	
<?php if($opacity>=0 && $opacity<=100): ?>
<script>
(function ($) {
	$(document).ready(function(){ 
		$('#acm-cliens-<?php echo $module->id ?> .client-img img.img-responsive').css({
			'filter':'alpha(opacity=<?php echo $opacity ?>)', 
			'zoom':'1', 
			'opacity':'<?php echo $opacity/100 ?>'
		});
	});
})(jQuery);
</script>
<?php endif; ?>