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

<div class="section-inner">
	  <div class="acm-stats style-2">    
  	<?php if ($helper->get ('acm-title') || $helper->get ('acm-description')) : ?>
  	<header class="stats-header text-center">
      <?php if ($helper->get ('acm-title')) : ?>
        <h3 class="acm-title"><?php echo $helper->get ('acm-title') ?></h3>
      <?php endif; ?>
      <?php if ($helper->get ('acm-description')) : ?>
        <p class="acm-description"><?php echo $helper->get ('acm-description') ?></p>
      <?php endif; ?>
    </header>
    <?php endif; ?>
  
    <ul class="stats-list row">
      <?php $count=$helper->getRows('data-style-2.stats-count'); ?>
      <?php for ($i=0; $i<$count; $i++) : ?>
      <?php if ($helper->get ('data-style-2.stats-count', $i)) : ?>
      
      <?php 
      	$colNumber = $helper->get ('stats-column');
  			$statsCount = $helper->get ('data-style-2.stats-count', $i);
  			$progressStyle = "";
  			$deg = 360*$statsCount/100;
  			$progressRotate = "transform: rotate(".$deg."deg); -webkit-transform: rotate(".$deg."deg);";
  			
  			$statsColor = $helper->get ('data-style-2.stats-color', $i);
  			$statsBg = $helper->get ('data-style-2.stats-bg', $i);
  			$statsShadow = $helper->get ('data-style-2.stats-shadow', $i);
  			
  			if ($statsCount > 50): 
  				$progressChartStyle =  "background-color:".$statsColor."";
  				$progressFillStyle =  "background-color:".$statsShadow."";
  			else: 
  				$progressChartStyle =  "background-color:".$statsShadow."";
  				$progressFillStyle =  "background-color:".$statsColor."";
  			endif;
  			
  		?>
      <li class="col-md-<?php echo (12/$colNumber) ?> col-sm-6 col-xs-12 stats-asset">
      
      <div class="progress-pie-chart <?php if ($statsCount > 50): ?> gt-50 <?php endif; ?>" style="<?php echo $progressChartStyle; ?>">
  		  <div class="ppc-progress">
  		    <div class="ppc-progress-fill" style="<?php echo $progressRotate; echo $progressFillStyle; ?>"></div>
  		  </div>
  		  <div class="ppc-percents" style="background-color: <?php echo $statsBg; ?>">
  		    <div class="pcc-percents-wrapper">
  		      <span <?php if($statsColor): ?> style="color: <?php echo $statsColor; ?>;" <?php endif; ?> ><?php echo $statsCount ?>%</span>
  		    </div>
  		  </div>
  		</div>
  		
      <?php if ($helper->get ('data-style-2.stats-name', $i)) : ?>
        <span class="stats-subject"><?php echo $helper->get ('data-style-2.stats-name', $i) ?></span>
      <?php endif; ?>
      </li>
      <?php endif; ?>
    <?php endfor;?>
    </ul>
  </div>
</div>