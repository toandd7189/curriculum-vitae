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
  <div id="acm-contact-<?php echo $module->id; ?>" class="acm-contact-info style-1">
		<dl class="info-list">
		  <?php $count= $helper->getRows('contact-info-item.contact-info-name'); ?>
		  
		  <?php for ($i=0; $i<$count; $i++) : ?>
		  
			<dt>
				<?php if($helper->get ('contact-info-item.contact-info-icon', $i)): ?><i class="fa <?php echo $helper->get ('contact-info-item.contact-info-icon', $i); ?>"></i><?php endif; ?>
				<span><?php echo $helper->get ('contact-info-item.contact-info-name', $i) ?></span>
			</dt>
		
	  	<?php if ($helper->get ('contact-info-item.contact-info-value', $i)) : ?>
	    <dd><?php echo $helper->get ('contact-info-item.contact-info-value', $i) ?></dd>
	  	<?php endif; ?>
	  	
			<?php endfor; ?>
		</dl>
  </div>
</div>