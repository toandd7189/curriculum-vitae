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
  $doc->addScript (T3_TEMPLATE_URL.'/acm/features-intro/js/jquery.shuffleLetters.js');

?>

<?php
    $animation = $helper->get('animation');
    $effectBlur = $helper->get('effect-blur');
    $acmStyle = $helper->get('acm-style');
    $horizontalPosition = $helper->get('horizontal-position');
    $verticalPosition = $helper->get('vertical-position');
		$posTitle = $helper->get('position-title');
    $positionTitle = "col-sm-8 col-md-6";
    if ($posTitle == "text-center") {
      $positionTitle = "col-xs-12 text-center";
    };
?>

<div class="acm-features-intro style-1 <?php echo $acmStyle ?>">
  <div class="container">
  	<div id="acm-features-intro-<?php echo $module->id; ?>">
  		<div class="item">
        <div class="row">

          <div class="<?php echo $positionTitle; ?> features-info">
            <?php if($helper->get('title')): ?>
              <h1 class="item-title"><?php if($animation == 0) echo $helper->get('title') ?></h1>
            <?php endif; ?>

            <?php if($helper->get('position')): ?>
              <span class="item-position"><?php if($animation == 0) echo $helper->get('position') ?></span>
            <?php endif; ?>

            <?php if($helper->get('des')): ?>
              <p class="item-description"><?php if($animation == 0) echo $helper->get('des') ?></p>
            <?php endif; ?>
          </div>
        </div>
  		</div>
  	</div>
  </div>


  <div class="bg" style="transform: translate3d(0,0,0);background-image: url('<?php echo $helper->get('image'); ?>'); background-position: <?php echo $horizontalPosition ?> <?php echo $verticalPosition ?>; "></div>
  <?php if($effectBlur == 1) :?>
    <div class="bg-blur" style="transform: translate3d(0,0,0);background-image: url('<?php echo $helper->get('image'); ?>'); background-position: <?php echo $horizontalPosition ?> <?php echo $verticalPosition ?>;"></div>
  <?php endif ;?>
</div>

<script>
 (function($){
  <?php if($effectBlur == 1) :?>
    $(window).scroll(function () {
      var oVal = $(window).scrollTop() / $(window).height()*1.4;
      $('.bg-blur').css('opacity', oVal.toFixed(1));
    });
  <?php endif ;?>

  $(document).ready(function () {
    $("#t3-header").addClass('<?php echo $acmStyle ?>');
  })
  })(jQuery);
</script>

<?php if($animation == 1) : ?>
<script>
     (function($){
      if($(window).width() > 992) {
        // Add Animation for title
        <?php if($helper->get('title')): ?>
          var itemTitle = $(".item-title");

          setTimeout(function(){
            // Shuffle the container with custom text
            itemTitle.shuffleLetters({
              "text": "<?php echo $helper->get('title') ?>",
              "fps": "<?php echo $helper->get('title-speed') ?>"
            });

          },<?php echo $helper->get('title-time') ?>);
        <?php endif; ?>

         // Add Animation for position
        <?php if($helper->get('position')): ?>
          var itemPosition = $(".item-position");

          setTimeout(function(){
            // Shuffle the container with custom text
            itemPosition.shuffleLetters({
              "text": "<?php echo $helper->get('position') ?>",
              "fps": "<?php echo $helper->get('position-speed') ?>"
            });

          },<?php echo $helper->get('position-time') ?>);
        <?php endif; ?>

         // Add Animation for description
        <?php if($helper->get('des')): ?>
          var itemDesc = $(".item-description");

          setTimeout(function(){
            // Shuffle the container with custom text
            itemDesc.shuffleLetters({
              "text": "<?php echo $helper->get('des') ?>",
              "fps": "<?php echo $helper->get('des-speed') ?>"
            });

          },<?php echo $helper->get('des-time') ?>);
        <?php endif; ?>
      } else {
        $(".item-title").text("<?php echo $helper->get('title') ?>");
        $(".item-position").text("<?php echo $helper->get('position') ?>");
        $(".item-description").text("<?php echo $helper->get('des') ?>");
      };
    })(jQuery);
  </script>
<?php endif; ?>