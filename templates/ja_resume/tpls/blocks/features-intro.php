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

<?php if($this->hasMessage()) : ?>
<section class="wrap t3-features-intro <?php $this->_c('features-intro') ?>">
  <div class="section features-intro features-intro-message">
    <div class="container">
      <jdoc:include type="message" />
    </div>
  </div>
</section>
<?php endif ?>

<?php if ($this->countModules('features-intro')) : ?>
	<!-- FEATURES INTRO -->
	<section class="wrap t3-features-intro <?php $this->_c('features-intro') ?>">
		<jdoc:include type="modules" name="<?php $this->_p('features-intro') ?>" style="onepage" />
	</section>
	<!-- //FEATURES INTRO -->
<?php endif ?>