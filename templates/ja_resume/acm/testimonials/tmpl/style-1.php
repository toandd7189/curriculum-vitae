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
  $count = $helper->getRows('data-special.testimonial-text');
  $textColor = $helper->get('text-color');
  $authorTextColor = $helper->get('author-info-color');
  $authorName = $helper->get('author-name');
  $fullWidth = $helper->get('full-width');
?>

  
<div class="acm-testimonials style-4">
  <!-- BEGIN: TESTIMONIALS STYLE 1 -->
	<div id="acm-testimonials-<?php echo $module->id ?>" class="panel-container testimonial-content">
      <h3 class="acm-title ja-animate" data-animation="move-from-left">
        <span><?php echo $helper->get('acm-title') ?></span>
      </h3>
     
      <div class="testimonial-text ja-animate" <?php if($textColor) : ?> style="color: <?php echo $textColor; ?>;" <?php endif; ?> data-animation="pop-up">
        <?php for ($i=0; $i<$count; $i++) : ?>
        <div class="quote-item <?php if ($i == 0) echo 'active' ?>" data-ref="quote-<?php echo $i ?>">
          <p>"<?php echo $helper->get ('data-special.testimonial-text', $i) ?>"</p>
        </div>
        <?php endfor ?>
      </div>
        
      <div class="author-info">
      <?php for ($i=0; $i<$count; $i++) : ?>
        <div class="author-item ja-animate <?php if ($i == 0) echo 'active' ?>" data-ref="quote-<?php echo $i ?>" data-animation="pop-up" data-delay="item-<?php echo $i ?>">
          <img src="<?php echo $helper->get ('data-special.author-img', $i) ?>" title="<?php echo $helper->get ('data-special.author-name', $i) ?>" alt=" " />
          <div class="author-detail">
            <span class="author-name">
              <?php echo $helper->get ('data-special.author-name', $i) ?>
            </span>

            <span class="author-title">
              <?php echo $helper->get ('data-special.author-title', $i) ?>
            </span>
          </div>
        </div>
      <?php endfor ?>
      </div>
  </div>
  <!-- END: TESTIMONIALS STYLE 1 -->
</div>

<script type="text/javascript">

(function ($) {
  $(document).ready(function () {
    $('.author-item').each(function(i) {
      var image = $(this);
      
      image.hover(function() {
        var panel = $(this).parents('.panel-container:first');
        
        $('.quote-item', panel).removeClass('active');
        $('.quote-item[data-ref="' + image.attr('data-ref') + '"]', panel).addClass('active');
        
        $('.author-item', panel).removeClass('active');
        image.addClass('active');
      });
    });
  });
}) (jQuery);

</script>