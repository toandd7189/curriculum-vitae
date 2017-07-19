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
	if (!$this->getParam('addon_offcanvas_enable')) return ;
?>

<button class="off-canvas-toggle  col-md-1 <?php $this->_c('off-canvas') ?>" type="button" data-pos="right" data-nav="#t3-off-canvas" data-effect="<?php echo $this->getParam('addon_offcanvas_effect', 'off-canvas-effect-4') ?>">
  <span class="patty"></span>
</button>

<!-- OFF-CANVAS SIDEBAR -->
<div id="t3-off-canvas" class="t3-off-canvas <?php $this->_c('off-canvas') ?>">

  <div class="t3-off-canvas-header">
    <h2 class="t3-off-canvas-header-title"><?php echo Jtext::_("TPL_SIDEBAR") ?></h2>
  </div>

  <div class="t3-off-canvas-body">

	<?php if ($this->countModules('languageswitcherload')) : ?>
		<!-- LANGUAGE SWITCHER -->
		<div class="languageswitcherload">
			<jdoc:include type="modules" name="<?php $this->_p('languageswitcherload') ?>" style="T3Xhtml" />
		</div>
		<!-- //LANGUAGE SWITCHER -->
	<?php endif ?>
	
    <jdoc:include type="modules" name="<?php $this->_p('off-canvas') ?>" style="T3Xhtml" />
  </div>

</div>
<!-- //OFF-CANVAS SIDEBAR -->
