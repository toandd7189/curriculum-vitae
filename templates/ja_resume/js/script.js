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

// Minified version of isMobile
!function(a){var b=/iPhone/i,c=/iPod/i,d=/iPad/i,e=/(?=.*\bAndroid\b)(?=.*\bMobile\b)/i,f=/Android/i,g=/(?=.*\bAndroid\b)(?=.*\bSD4930UR\b)/i,h=/(?=.*\bAndroid\b)(?=.*\b(?:KFOT|KFTT|KFJWI|KFJWA|KFSOWI|KFTHWI|KFTHWA|KFAPWI|KFAPWA|KFARWI|KFASWI|KFSAWI|KFSAWA)\b)/i,i=/IEMobile/i,j=/(?=.*\bWindows\b)(?=.*\bARM\b)/i,k=/BlackBerry/i,l=/BB10/i,m=/Opera Mini/i,n=/(CriOS|Chrome)(?=.*\bMobile\b)/i,o=/(?=.*\bFirefox\b)(?=.*\bMobile\b)/i,p=new RegExp("(?:Nexus 7|BNTV250|Kindle Fire|Silk|GT-P1000)","i"),q=function(a,b){return a.test(b)},r=function(a){var r=a||navigator.userAgent,s=r.split("[FBAN");return"undefined"!=typeof s[1]&&(r=s[0]),s=r.split("Twitter"),"undefined"!=typeof s[1]&&(r=s[0]),this.apple={phone:q(b,r),ipod:q(c,r),tablet:!q(b,r)&&q(d,r),device:q(b,r)||q(c,r)||q(d,r)},this.amazon={phone:q(g,r),tablet:!q(g,r)&&q(h,r),device:q(g,r)||q(h,r)},this.android={phone:q(g,r)||q(e,r),tablet:!q(g,r)&&!q(e,r)&&(q(h,r)||q(f,r)),device:q(g,r)||q(h,r)||q(e,r)||q(f,r)},this.windows={phone:q(i,r),tablet:q(j,r),device:q(i,r)||q(j,r)},this.other={blackberry:q(k,r),blackberry10:q(l,r),opera:q(m,r),firefox:q(o,r),chrome:q(n,r),device:q(k,r)||q(l,r)||q(m,r)||q(o,r)||q(n,r)},this.seven_inch=q(p,r),this.any=this.apple.device||this.android.device||this.windows.device||this.other.device||this.seven_inch,this.phone=this.apple.phone||this.android.phone||this.windows.phone,this.tablet=this.apple.tablet||this.android.tablet||this.windows.tablet,"undefined"==typeof window?this:void 0},s=function(){var a=new r;return a.Class=r,a};"undefined"!=typeof module&&module.exports&&"undefined"==typeof window?module.exports=r:"undefined"!=typeof module&&module.exports&&"undefined"!=typeof window?module.exports=s():"function"==typeof define&&define.amd?define("isMobile",[],a.isMobile=s()):a.isMobile=s()}(this);

// Inview events
(function($) {
    $(document).ready(function(){
        $('.section, .feature-animate, .sections-wrap .t3-module').bind('inview', function (event, visible, visiblePartX, visiblePartY) {
            if (visible) {
              $(this).addClass('inview');
            }
        });
    var masttopHeight = $('.t3-mast-top').height() - $('#t3-header.t3-header').outerHeight(),
        headerHeight = $('#t3-header.t3-header').outerHeight()/2;

        // Add Affix for Header
        function affixHeader() {

          if($('.t3-mast-top').length > 0) {
            $('#t3-header').affix({
              offset: {
                top: masttopHeight,
              }
            })
          } else {
            $('#t3-header').affix({
              offset: {
                top: headerHeight,
              }
            })
          }
        }

        affixHeader();

        $(window).resize(function() {
          affixHeader();
        })
    });

    $(window).load(function(){
      var masttopHeight = $('.t3-mast-top').height() - $('#t3-header.t3-header').outerHeight(),
        headerHeight = $('#t3-header.t3-header').outerHeight()/2;
		  
      addJAffix();

    	$(window).scroll(function(){
			   addJAffix();
    	});

      function addJAffix() {
    
    if($('.t3-mast-top').length > 0) {
      if ($(window).scrollTop() >= masttopHeight) {
        $('#t3-header').addClass('ja-affix-top');
      } else {
        $('#t3-header').removeClass('ja-affix-top');
      }
    } else {
      if ($(window).scrollTop() >= headerHeight) {
        $('#t3-header').addClass('ja-affix-top');
      } else {
        $('#t3-header').removeClass('ja-affix-top');
      }
    }
  }
    });

	
})(jQuery);

// Isotope
(function($){
  $(document).ready(function(){
    var $container = $('.isotope-layout .isotope');

    if (!$container.length) return ;

    $container.isotope({
      itemSelector: '.item',
      masonry: {
        columnWidth: '.grid-sizer',
      }
    });
    
    // re-order when images loaded
    $container.imagesLoaded(function(){
      $container.isotope();
    
      /* fix for IE-8 */
      setTimeout (function() {
        $('.isotope-layout .isotope').isotope();
      }, 3000);  
    });
  });
})(jQuery);

// TAB
// -----------------
(function($){
  $(document).ready(function(){
  if($('.nav.nav-tabs').length > 0 && !$('.nav.nav-tabs').hasClass('nav-stacked')){
    $('.nav.nav-tabs li').click(function (e) {
    e.preventDefault();
    $(this).find('a').tab('show');
    })
  }
  
  });
})(jQuery);


// Full-nav click to show off-canvas menu
(function($){
  $(document).ready(function(){
    jQuery('body').on('click', function(e) {
      if (jQuery(e.target).is('a[href="#full-nav"]')){
        $('.off-canvas-toggle').trigger('tap', e);
        e.stopPropagation();
        e.preventDefault();
        return false;
      }
    });
    jQuery('.off-canvas-toggle').on('tap', function() {
		if (isMobile.tablet)
	    	jQuery('.t3-header').css( 'margin-top', (jQuery(window).scrollTop())+'px');
    });
  });
  // off click for full-nav
  $(window).load(function(){
    setTimeout(function(){
      $('a[href="#full-nav"]').off();
    },100);
  })
})(jQuery);