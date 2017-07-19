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
		$count = $helper->getRows('data.title-social');
    $grid = strlen($helper->get('data.title-social',0));
?>

<div class="acm-features-intro style-2">
  <div class="row">
    <div class="<?php if($grid > 1){echo "col-sm-7 col-md-8";} else {echo "col-xs-12";} ?>">
      <div class="features-info">
        <h3 class="acm-title"><span><?php echo $helper->get('title') ?></span></h3>
        <p><?php echo $helper->get('des') ?></p>

        <?php if($helper->get('button-title')) :?>
          <a class="btn btn-primary btn-lg" href="<?php echo $helper->get('button-link') ?>"><?php echo $helper->get('button-title') ?><i class="<?php echo $helper->get('button-icon') ?>" aria-hidden="true"></i></a>
        <?php endif ?>
      </div>
    </div>

    <?php if($grid > 1) :?>
      <div class="col-sm-5 col-md-4">
        <ul class="list-social ja-animate" data-animation="move-from-right">
          <?php 
              for ($i=0; $i<$count; $i++) : 
            ?>
            <li class="social-items">
              <?php if($helper->get('data.icon-social', $i)): ?>
                <i class="fa fa-<?php echo $helper->get('data.icon-social', $i) ?>"></i>
              <?php endif; ?>

              <?php if($helper->get('data.icon-social', $i)): ?>
                <a href="<?php echo $helper->get('data.link-social', $i) ?>"><?php echo $helper->get('data.title-social', $i) ?></a>
              <?php endif; ?>
            </li>
          <?php endfor ;?>
        </ul>
      </div>
    <?php endif ;?>
  </div>
</div>
