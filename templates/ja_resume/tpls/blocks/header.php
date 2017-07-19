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

// get params
$sitename  = $this->params->get('sitename');
$slogan    = $this->params->get('slogan', '');
$logotype  = $this->params->get('logotype', 'text');
$logoimage = $logotype == 'image' ? $this->params->get('logoimage', T3Path::getUrl('images/logo.png', '', true)) : '';
$logoimgsm = ($logotype == 'image' && $this->params->get('enable_logoimage_sm', 0)) ? $this->params->get('logoimage_sm', T3Path::getUrl('images/logo-sm.png', '', true)) : false;
$logolink  = $this->params->get('logolink');

if (!$sitename) {
	$sitename = JFactory::getConfig()->get('sitename');
}

// get logo url
$logourl = JURI::base(true);
if ($logolink == 'page') {
  $logopageid = $this->params->get('logolink_id');
  $_item = JFactory::getApplication()->getMenu()->getItem ($logopageid);
  if ($_item) {
    $logourl = JRoute::_('index.php?Itemid=' . $logopageid);
  }
}

?>

<!-- HEADER -->
<header id="t3-header" class="wrap t3-header">
<div class="container">
	<div class="row">

		<!-- LOGO -->
		<div class="col-xs-2 col-sm-3 logo">
			<div class="logo-<?php echo $logotype, ($logoimgsm ? ' logo-control' : '') ?>">
				<a href="<?php echo $logourl ?>" title="<?php echo strip_tags($sitename) ?>">
					<?php if($logotype == 'image'): ?>
						<img class="logo-img" src="<?php echo JURI::base(true) . '/' . $logoimage ?>" alt="<?php echo strip_tags($sitename) ?>" />
					<?php endif ?>
					<?php if($logoimgsm) : ?>
						<img class="logo-img-sm" src="<?php echo JURI::base(true) . '/' . $logoimgsm ?>" alt="<?php echo strip_tags($sitename) ?>" />
					<?php endif ?>
					<span><?php echo $sitename ?></span>
				</a>
				<small class="site-slogan"><?php echo $slogan ?></small>
			</div>
		</div>
		<!-- //LOGO -->

    <?php if ($this->getParam('addon_offcanvas_enable')) : ?>
      <?php $this->loadBlock ('off-canvas') ?>
    <?php endif ?>


		<!-- MAIN NAVIGATION -->
		<nav id="t3-mainnav" class="col-xs-12 col-md-8 navbar navbar-default t3-mainnav pull-right">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				
					<?php if ($this->getParam('navigation_collapse_enable', 1) && $this->getParam('responsive', 1)) : ?>
						<?php $this->addScript(T3_URL.'/js/nav-collapse.js'); ?>
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".t3-navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					<?php endif ?>
				</div>

				<?php if ($this->getParam('navigation_collapse_enable')) : ?>
					<div class="t3-navbar-collapse navbar-collapse collapse"></div>
				<?php endif ?>

				<div class="t3-navbar navbar-collapse collapse">
					<jdoc:include type="<?php echo $this->getParam('navigation_type', 'megamenu') ?>" name="<?php echo $this->getParam('mm_type', 'mainmenu') ?>" />
				</div>

		</nav>
		<!-- //MAIN NAVIGATION -->

	</div>
</div>
</header>
<!-- //HEADER -->

<?php if ($this->countModules('mast-top')) : ?>
	<!-- MAST TOP -->
	<section class="wrap t3-features-intro t3-mast-top<?php $this->_c('mast-top') ?>">
		<jdoc:include type="modules" name="<?php $this->_p('mast-top') ?>" style="onepage" />
	</section>
	<!-- //MAST TOP -->
<?php endif ?>

<?php
$app = JFactory::getApplication();
$menu = $app->getMenu();
$lang = JFactory::getLanguage();
?>

<!-- smooth scroll -->
<script type="text/javascript">

  !function($) {
    <?php if(isset($menu->getActive()->id)) { ?>
	 var frontpage = '<?php echo $menu->getActive()->id; ?>'; // check if we in frontpage or not.
    <?php } else { ?>
   var frontpage = ''; 
    <?php } ?>
	if ($('.t3-navbar ul>li').first().data('id') != frontpage)
		frontpage = '_false';
	var base_url = '<?php echo JURI::base(true) ?>';
    var winurl = window.location.href.replace(/([^\#]*)(.*)/, '$1');

    window.reflow = function () {
      if('ontouchstart' in window){
        document.documentElement.style.width = (document.documentElement.offsetWidth + 1) + 'px';
        setTimeout(function () {
          document.documentElement.style.width = '';
        }, 0);
      }
    };

	// remove everything before # tag. eg. .../index.php/...#
    var current_url = location.href.replace(/([^\#]*)(.*)/, '$1');
    var pattern = /^(.*?)#/i;
    $('.t3-navbar ul li a').each (function (){
    	if (frontpage == '_false')
    		return false;
    	$_href = $(this).attr('href');
    	$(this).attr('href', $_href.replace(pattern, '#'));
      var $this = $(this), 
        href = this.href,
        target = this.hash ? this.hash : href.replace(/.*(?=#[^\s]+$)/, ''),
        target_url = href.replace(/([^\#]*)(.*)/, '$1');

      if(this.hostname != window.location.hostname || target.substr(0, 1) != '#'){
         if ($(this).hasClass('home'))
             $(this).attr('href', '#onepage-home').data('target', '#onepage-home'); // for home menu
       return;
      }

      // replace the href if this url point to a hash in current page
      if (current_url == target_url) {
        $this.attr('href', target).data('target', target);
      }
    });

	// bind animation click to menu.
    $('.t3-navbar ul li a').on('click', function(e) {
      if (!$(this).data('target')){
        return;
      }
	  var target = this.href.replace(/.*(?=#[^\s]+$)/, '');
	  $(this).blur();
      if (target && ($(target).length)) {
        e.preventDefault();

        $('html,body').animate({scrollTop: Math.max(0, 
                  $(target).offset().top
                   - ((!($('html').hasClass('off-canvas') && $('.btn-navbar').is(':visible')) && $('#ja-header').css('position') == 'fixed') ? $('#ja-header').height() : 0)
                    + 2)}, {
          duration: 800, 
          easing: 'easeInOutCubic',
          complete: window.reflow
        });
      } else { //not found
        if(frontpage == '_false'){
          window.location.href = base_url.replace(/([^\#]*)(.*)/, '$1') + target;
        }
      }
    });

    $(document).ready(function(){
      var ftarget = window.location.href.replace(/.*(?=#[^\s]+$)/, '');

      if(ftarget.substr(0, 1) == '#'){
        ftarget = $(ftarget);

        if(ftarget.length){
          $('html,body').scrollTop(Math.max(0, ftarget.offset().top - ((!($('html').hasClass('off-canvas') && $('.btn-navbar').is(':visible')) && $('#ja-header').css('position') == 'fixed') ? $('#ja-header').height() : 0) + 1));
          window.reflow();
        }
      }

      var homelink = $('.t3-navbar ul li a.home')[0];
      if(homelink){
        var home_url = homelink.href.replace(/([^\#]*)(.*)/, '$1'),
          home_target = homelink.hash ? homelink.hash : homelink.href.replace(/.*(?=#[^\s]+$)/, '');

        if(home_url == winurl){
          if(home_target.substr(0, 1) != '#'){
            homelink.href = home_target = '#onepage-home';
            $(homelink).data('target', home_target);
          }

          home_target = $(home_target);
          if(!home_target.length){
            home_target = $('<div id="onepage-home" style="width: 0; height: 0; visibility: hidden">').prependTo(document.body);
          }

        } else {
          home_target = null;
        }

        $(homelink).off('click').on('click', function(e){
		  if(frontpage == '_false'){
			window.location.href = base_url.replace(/([^\#]*)(.*)/, '$1') + '#onepage-home';
// 			e.preventDefault();
// 			return;
		  }
          if(home_target){
            e.preventDefault();

            $('html,body').animate({scrollTop: Math.max(0, (home_target.offset().top - $('#ja-header').height() + 2))}, {
              duration: 800, 
              easing: 'easeInOutCubic',
              complete: window.reflow
            });
          }
        });
      }
    });

    // scrollspy - active the onepage menu item when scrolling
    $(window).load(function(){
      $('body').scrollspy({target: '.t3-megamenu', offset: 190});
      $(window).scroll(function(){
      	if ($(window).scrollTop() < $(window).height()-190) {
      		$('.t3-navbar ul li.current a.home').parent('li').addClass('active');
      	} else {
      		$('.t3-navbar ul li.current a.home').parent('li').removeClass('active');
      	}
      });
    });
  }(window.jQuery);
</script>
<!-- //smooth scroll -->