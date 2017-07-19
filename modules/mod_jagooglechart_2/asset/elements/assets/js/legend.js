
// Legend
jQuery(document).ready(function($){
	// group index for legend
	var $legends = $('h3.legend'),
		group = 0;

	$legends.each (function () {

		var $legend = $(this),
			$legendGroup = $legend.closest('.control-group'),
			isSub = $legend.is('.sub-legend');
		// add legend class
		$legendGroup.addClass(isSub ? 'sub-legend-group' : 'top-legend-group');
		var	$params = $legendGroup.nextUntil (function() {
				var $next = $(this),
					$nextIsLegend = $next.has('h3.legend').length,
					$nextIsSubLegend = $nextIsLegend && $next.find('h3.legend').is('.sub-legend');
				if (!isSub && $nextIsLegend && $nextIsSubLegend) {
					$next.find('h3.legend').data('top-legend', $legend);
				} 

				return !$next.is('.control-group') || ($nextIsLegend && (isSub || !$nextIsSubLegend));
			});

		// store its legend
		$params.data('legend', $legend);
		$legend.data('params', $params);
/*
		if ($legend.data('expend')) {
			$legend.closest('.control-group').addClass('group-expend');
		} else {
			$legend.closest('.control-group').addClass('group-collapse');
			$legendGroup.data('expend', 0);
		}
*/
	});


	// grouping legend and params
	$('.tab-pane').each(function(){
		var $pane = $(this),
			$topLegends = $pane.find('.top-legend-group');		
		$('<div />').addClass('group-legends').appendTo($pane).append($topLegends);
		$topLegends.each(function(){
			var $legend = $(this).find('h3'),
				$params = $legend.data('params'),
				$subLegends = $params.filter('.sub-legend-group'),
				$topGroup = $('<div />');

			$topGroup.addClass('top-group').appendTo($pane);
			var $subGroupDirect = $('<div />').addClass('sub-group sub-group-direct').appendTo($topGroup).append(
																$('<div />').addClass('sub-group-inner').append($params)
														);
			$subLegends.each(function() {
				var $subLegendGroup = $(this),
					$subLegend = $subLegendGroup.find('h3'),
					$params = $subLegend.data('params');
				$('<div />').addClass('sub-group').appendTo($topGroup).append(
						$('<div />').addClass('sub-group-inner').append($subLegendGroup).append(
							$('<div />').addClass('sub-group-params').append($params)
						)
					);
			});
			// remove empty group
			if (!$subGroupDirect.find('.sub-group-inner').children().length) $subGroupDirect.remove();
			// add sub-group-direct class to top-group-enabler
			$topGroup.find('.top-group-enabler').closest('.sub-group').addClass('sub-group-direct');
			// store for later use
			$(this).data('top-group', $topGroup);
		});
	});


	// show/hide top group
	var showTopGroup = function ($legendGroup) {
		var $topGroup = $legendGroup.data('top-group'),
			$tabPane = $legendGroup.closest('.tab-pane'),
			$otherLegendGroups = $tabPane.find('.top-legend-group').not($legendGroup),
			$otherTopGroups = $tabPane.find('.top-group').not($topGroup);
		$otherTopGroups.removeClass('active').hide();
		$topGroup.addClass('active').fadeIn();
		$legendGroup.addClass('active');
		$otherLegendGroups.removeClass('active');		
	}

	$('.top-legend-group').on('click', function(){
		showTopGroup($(this));
		if (localStorage) {
			localStorage.setItem('last_active_group','#' + $(this).closest('.tab-pane').attr('id') 
													+ ' .top-legend-group:nth-child(' + ($(this).index() + 1) + ')');
		}
	});

	// last active
	var $lastActiveGroup;
	if (localStorage && localStorage.getItem('last_active_group')) {
		$lastActiveGroup = $(localStorage.getItem('last_active_group'));
	}

	setTimeout(function(){
		$('.tab-pane .top-legend-group:first-child').trigger('click');
		if($lastActiveGroup){
			$lastActiveGroup.trigger('click');
		}
		
	}, 500);

/*
	// show/hide sub group
	var toggleSubGroup = function ($legendGroup) {
		var $groupParams = $legendGroup.next();
		if ($legendGroup.data('expend')) {
			$legendGroup.removeClass('group-expend').addClass('group-collapse').data('expend', 0);
			// $legend.data('params').slideUp();
			$groupParams.slideUp();
		} else {
			$groupParams.slideDown();
			$legendGroup.removeClass('group-collapse').addClass('group-expend').data('expend', 1);
		}	
	}

	$('.sub-legend-group').on('click', function(e){
		console.log(e.target);
		// click on enabler
		if ($(e.target).parent().is('fieldset')) return;
		toggleSubGroup($(this));
	});
*/

	// Enabler
	var toggleEnablerGroup = function ($enabler) {
		var enabled = $enabler.find('input:checked').val(),
			isTopEnabler = $enabler.is('.top-group-enabler'),
			$legendGroup = $enabler.closest('.control-group'),
			$groupParams = $legendGroup.next();
		if (enabled == '1') {
			if (isTopEnabler) {
				$legendGroup.closest('.top-group').find('.sub-group').show();
			}
			$groupParams.show();
		} else {
			if (isTopEnabler) {
				$legendGroup.closest('.top-group').find('.sub-group').slice(1).hide();
			}
			$groupParams.hide();
		}
	}
	$('.group-enabler, .top-group-enabler').on ('click', function(e) {
		toggleEnablerGroup($(this));
		e.stopPropagation();
	});

	// first enabler
	$('.group-enabler, .top-group-enabler').each (function () {
		toggleEnablerGroup ($(this));
	});
/*
	$legends.on('click', function() {
		var $legend = $(this);

		// no action need for group alway extend
		if ($legend.data('expend') == 'all') return;

		// toggle group
		if ($legend.is('.sub-legend')) {
			if ($legend.data('expend')) {
				$legend.closest('.control-group').removeClass('group-expend').addClass('group-collapse');
				$legend.data('expend', 0);
				$legend.data('params').slideUp();
			} else {
				// expend this one
				if ($legend.data('disabled')) {
					$legend.data('params').first().slideDown();
				} else {
					$legend.data('params').slideDown();
				}
				$legend.closest('.control-group').removeClass('group-collapse').addClass('group-expend');
				$legend.data('expend', 1);
			}
		} else {
			// collapse other top group
			var $sibling_legends = $legend.closest('.tab-pane').find('h3.legend').not($legend).not('.sub-legend')
									.filter (function () {
										return $(this).data('expend') != 'all';
									});
			$sibling_legends.each (function () {
				var $this = $(this);
				//$this.data('params').fadeOut();
				$this.data('params').closest('.top-group').fadeOut();
				$this.closest('.control-group').removeClass('group-expend').addClass('group-collapse');
				$this.data('expend', 0);
			});

			// show top group
			$legend.data('params').closest('.top-group').fadeIn();

			// find group enabler
			if ($legend.data('disabled')) {
				// show first param - the enabler only
				$legend.data('params').first().fadeIn();
			} else {
				// slide all direct params
				var $direct_params = $legend.data('params').filter(function() {
					return $(this).data('legend').is ($legend);
				});
				$direct_params.fadeIn();
			}

			// find all sub legend and expend only one
			var $sublegends = $legend.data('params').find('h3.legend');
			// find expended legend
			if ($sublegends.length) {
				var $activelegends = $sublegends.filter(function(){
					return Boolean($(this).data('expend'));
				});
				
				if (!$activelegends.length) $activelegends = $sublegends.first();
				
				$activelegends.each (function () {
					var $activelegend = $(this);
					// fadeIn sub legend only when group enabled
					if (!$legend.data('disabled')) {
						// extend all legend
						$sublegends.closest('.control-group').fadeIn();
						// expend this one
						if ($activelegend.data('disabled')) {
							$activelegend.data('params').first().fadeIn();
						} else {
							$activelegend.data('params').fadeIn();
						}
					}
					$activelegend.closest('.control-group').removeClass('group-collapse').addClass('group-expend');
					if (!$activelegend.data('expend')) $activelegend.data('expend', 1);
				});
			}

			// show separator
			$legend.data('params').filter('.legend-separator').fadeIn();

			$legend.closest('.control-group').removeClass('group-collapse').addClass('group-expend');
			$legend.data('expend', 1);								
		}

		// tracking last active item
		if (localStorage) 
			localStorage.setItem('last_clicked_legend','#' + $legend.closest('.tab-pane').attr('id') 
													+ ' .control-group:nth-child(' + ($legend.closest('.control-group').index() + 1) + ') h3.legend');
	});
*/
	// show all legend
/*
	$legends.filter(function() {
		return $(this).data('expend') == 'all';
	}).addClass ('expend-all');

	var groupVisible = function (enabler) {
		var $enabler = $(enabler),
			enabled = $enabler.val(),
			$this_param = $enabler.closest('.control-group'),
			$this_legend = $this_param.data('legend'),
			$other_params = $this_legend.data('params').not($this_param).not('.legend-separator');

		$this_legend.data('disabled', enabled == 0);
		if (!$this_legend.data('expend') || ($this_legend.is('.sub-legend') 
			&& ($this_legend.data('top-legend').data('disabled') || !$this_legend.data('top-legend').data('expend')))) return;
		if (enabled == 1) {
			// show other params
			$other_params = $other_params.filter(function(){
				var $param = $(this),
					$legend = $param.data('legend');
				return $legend.data('expend') && (!$legend.data('disabled') || $param.is ($legend.data('params').first()));
			}).slideDown();
		} else {
			$other_params.slideUp();
		}		
	};
	// Change event
	$('.group-enabler input').on ('change', function () {
		groupVisible (this);
	});

	// first state
	$('.group-enabler input:checked').each (function () {
		groupVisible (this);
	});


	// last active
	if (localStorage && localStorage.getItem('last_clicked_legend')) {
		var $last_legend = $(localStorage.getItem('last_clicked_legend'));
		if ($last_legend.length) {
			if ($last_legend.is ('.sub-legend')) {
				$top_legend = $last_legend.data('top-legend');				
				if (!$top_legend.data('expend')) $top_legend.trigger('click');
			}
			if (!$last_legend.data('expend')) $last_legend.trigger('click');
		}
	}
*/

});



// tracking change for group
jQuery(document).ready(function($) {
	var $inputs = $('#myTabContent').find('input, textarea, select'),
		tplhelperValue = $('#tplhelper').val(),
		tplhelper = null;
	try {
		tplhelper = JSON.parse (tplhelperValue);
	} catch (e) {

	}

	if (tplhelper === null || typeof tplhelper !== 'object') tplhelper = {};
	// get origin value
	$inputs.each (function() {
		var $input = $(this),
			$val = $input.attr('type') == 'radio' ? $input.closest('fieldset').find('input:checked').val() : $input.val();
		$input.data('org-value', $val);
	});

	//tracking change
	$inputs.on('change', function () {
		var $input = $(this), val = $input.val(),
			groupid = $input.closest('.tab-pane').attr('id').substr(),
			group = groupid.substr(0, 7) == 'attrib-' ? groupid.substr(7) : null; 	
		// track change
		if ($input.data('org-value') != val) {
			var $legend = $input.closest('.control-group').addClass('modified').data('legend');
			if ($legend) {
				$legend.closest('.control-group').addClass('modified');
				// if sub legend, add modified to top legend
				if ($legend.is('.sub-legend')) {
					$legend.data('top-legend').closest('.control-group').addClass('modified');
				}
			}
			
			// add change for legend

			// update change status for hidden tplhelper
			if (group) {
				tplhelper[group] = 1;
				$('#tplhelper').val(JSON.stringify(tplhelper));
			}
		} else {
			var $legend = $input.closest('.control-group').removeClass('modified').data('legend');
			// detect legend changed
			if($legend){
				if ($legend.data('params').filter('.modified').length == 0) {
					$legend.closest('.control-group').removeClass('modified');
					// if sub-legend, check for top-legend
					if ($legend.is('.sub-legend')) {
						if ($legend.data('top-legend').data('params').filter('.modified').length == 0) {
							$legend.data('top-legend').closest('.control-group').removeClass('modified');
						}
					}
				}
			}
			if (group) {
				if ($input.closest('.tab-pane').find('.control-group').filter('.modified').length == 0) {
					// turn off change
					tplhelper[group] = 0;
					$('#tplhelper').val(JSON.stringify(tplhelper));
				}
			}
		}
	})

});
