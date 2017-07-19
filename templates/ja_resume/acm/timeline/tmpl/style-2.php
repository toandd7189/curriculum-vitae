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
	if($helper->getRows('data.title') >= $helper->getRows('data.description')) {
		$count = $helper->getRows('data.title');
	} else {
		$count = $helper->getRows('data.description');
	}
  $defaultWidth = $helper->get('block-size');

// sort by date.
$array=array();
for ($i=0; $i<$count; $i++) {
	$array[$i] = $helper->get('data.date', $i);
}
arsort($array);
$j=0;
?>

<div class="acm-timeline">
  <div class="acm-timeline style-2" id="acm-timeline-<?php echo $module->id; ?>">

    <?php if($helper->get('acm-title')): ?>
    <h3 class="acm-title ja-animate" data-animation="move-from-left">
      <span><?php echo $helper->get('acm-title') ?></span>
    </h3>
    <?php endif; ?>

    <div class="timeline-list" style="width: <?php if($defaultWidth): echo $defaultWidth; else: echo '800' ; endif; ?>px">
      <?php foreach ($array AS $i => $v) :
        $icon = $helper->get('data.icon', $i);
        $rowcount = (($j%2) == 0);

        $pullClass = '';
        $alignClass = '';
        if($rowcount) {
          $pullClass = "pull-left";
          $alignClass = 'text-right';
        } else {
          $pullClass = "pull-right";
          $alignClass = 'text-left';
        }
		$j++;
      ?>
        <div class="item-row">
          <div class="timeline-item">
            <div class="item-icon">
            </div>

              <div class="item-body <?php echo $alignClass; ?>">
                <div class="media-body">
                  <div class="item-content">
                  <?php if($helper->get('data.timeline-date', $i)): ?>
                    <div class="item-date">
                    <?php echo $helper->get('data.timeline-date', $i) ?>
                    </div>
                  <?php endif; ?>

                  <div class="item-info">
                    <?php if($helper->get('data.title', $i)): ?>
                      <h4 class="item-title">

                        <?php if($helper->get('data.title-link', $i)): ?>
                          <a href="<?php echo $helper->get('data.title-link', $i); ?>" title="<?php echo $helper->get('data.title', $i) ?>">
                        <?php endif; ?>

                        <?php echo $helper->get('data.title', $i) ?>

                        <?php if($helper->get('data.title-link', $i)): ?>
                          </a>
                        <?php endif; ?>

                      </h4>
                    <?php endif; ?>

                    <p class="ja-animate" data-animation="move-from-bottom" data-delay="item-<?php echo $j ?>"><?php echo $helper->get('data.description', $i) ?></p>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
        <?php endforeach ;?>
    </div>
  </div>
</div>



