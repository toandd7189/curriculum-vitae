function drawGoogleChart(input, container) {
	// parse data from input
	var textData = input['chartData'].split('\n'),
		arrData = [],
		data = new google.visualization.DataTable();
	if (textData.length == 1) {
		textData = jQuery.parseJSON(input['chartData']);
		for (var j=0; j<textData.length; j++) {
			textData[j] = JSON.stringify(textData[j]);
			textData[j] = textData[j].replace('\[','').replace('\]','');
		}
	}
	
	if (textData.length < 2) return;
		
	var cols;
	for (var i=0; i<textData.length; i++) {
		var row = textData[i].split(/[,;]\s*/);
		if (i == 0) {
			cols = row;
		} else {
			for (var j=0; j<row.length; j++) {
				if (i == 1) {
					data.addColumn (isNaN(row[j]) ? 'string' : 'number', cols[j]);
				}
				if (!isNaN(row[j])) {
					if (row[j] != '') {
						row[j] = parseFloat(row[j]);		
					} else {
						row[j] = 0;
					}						
				}
			}
			arrData.push(row);
		}
	}
	
	// Maximum and Minimum line.
	if (input['enable_max_line'] == '1' || input['enable_min_line']) {
		var $type = input.chartType, arrTypes = ['AreaChart', 'LineChart', 'ColumnChart', 'BarChart', 'SteppedAreaChart', 'CandlestickChart'];
		if (jQuery.inArray($type, arrTypes) != -1 && (input['enable_max_line'] == '1' || input['enable_min_line'] == '1')) {
			input.chartType = 'ComboChart';
			var $seriesType = $type.replace(/Chart/,'');
			if ($seriesType == 'Column' || $seriesType == 'Bar') {
				$seriesType = 'Bars';
			}
			input['option_seriesType'] = $seriesType[0].toLowerCase() + $seriesType.slice(1);
			input['option_series'] = {};
		} else {
			if (input['option_series']) {
				delete input['option_series'];
			}
			if (input['option_seriesType']) {
				delete input['option_seriesType'];
			}
		}
	}
	
	if (input['option_series']) {
		var firtRow = [], endrow = [];
		var maxCol = minCol = arrData[0][0]; 
		for (var i=0; i<arrData.length;i++) {
			if (arrData[i][0] > maxCol) {
				maxCol = arrData[i][0];
			}
			if (arrData[i][0] < minCol) {
				minCol = arrData[i][0];
			}
		}
		if (!isNaN(maxCol)) {
			maxCol = maxCol + 1;
		} else {
			maxCol = null;
		}
		if (!isNaN(minCol)) {
			minCol = minCol - 1;
		} else {
			minCol = null;
		}
		for (var j=0; j<arrData[0].length; j++) {
			if (j == 0) {
				firtRow.unshift(minCol);
				endrow.unshift(maxCol);
			} else {
				firtRow.push(null);
				endrow.push(null);
			}
		}
		
		var $lineDashStyle = [6,4];
		if (input['enable_max_line'] == '1' && input['enable_min_line'] != '1') {
			data.addColumn('number', 'Maximum');
			jQuery.each(arrData, function(key,value) {
				value.push(null);
			});
			
			firtRow.push(parseInt(input['max_value']));
			endrow.push(parseInt(input['max_value']));
			arrData.unshift(firtRow);
			arrData.push(endrow);
			
			input['option_series'][arrData[0].length-2] = {type: 'line', color: input['max_color'], lineDashStyle : $lineDashStyle, pointSize : 0, opacity : 0.7}; 
		} else if (input['enable_max_line'] != '1' && input['enable_min_line'] == '1') {
			data.addColumn('number', 'Minimum');
			jQuery.each(arrData, function(key,value) {
				value.push(null);
			});
			firtRow.push(parseInt(input['min_value']));
			endrow.push(parseInt(input['min_value']));
			arrData.unshift(firtRow);
			arrData.push(endrow);
			
			input['option_series'][arrData[0].length-2] = {type: 'line',color: input['min_color'], lineDashStyle : $lineDashStyle, pointSize : 0, opacity : 0.7}; 
		} else if (input['enable_max_line'] == '1' && input['enable_min_line'] == '1') {
			data.addColumn('number', 'Maximum');
			data.addColumn('number', 'Minimum');
			jQuery.each(arrData, function(key,value) {
				value.push(null);
				value.push(null);
			});
			
			firtRow.push(parseInt(input['max_value']));
			firtRow.push(parseInt(input['min_value']));
			endrow.push(parseInt(input['max_value']));
			endrow.push(parseInt(input['min_value']));
			arrData.unshift(firtRow);
			arrData.push(endrow);
			
			input['option_series'][arrData[0].length-3] = {type: 'line',color: input['max_color'], lineDashStyle : $lineDashStyle, pointSize : 0, opacity : 0.7}; 
			input['option_series'][arrData[0].length-2] = {type: 'line',color: input['min_color'], lineDashStyle : $lineDashStyle, pointSize : 0, opacity : 0.7}; 
		} else {
			input.chartType = $('select[name="jform\[params\]\[chartType\]"]').val();
			delete input['option_series'];
			if (input['option_seriesType']) {
				delete input['option_seriesType'];
			}
		}
		input['option_hAxis_viewWindow'] = {min: minCol, max:maxCol};
	} else {
		if (input['option_series']) {
			delete input['option_series']
		}
		if (input['option_seriesType']) {
			delete input['option_seriesType'];
		}
	}
	
	data.addRows (arrData);
	// Create our data table.
	var chartOptions = {};
	// build chart options
	for (var name in input) {
		if (!name.match(/^option_/)) continue;
		var arr = name.split('_');
		// ignore the prefix option_
		arr.shift();
		var propObj = chartOptions;
		for (var i=0; i<arr.length-1; i++) {
			if (propObj[arr[i]] == undefined) propObj[arr[i]] = {};
			propObj = propObj[arr[i]];
		}
		propObj[arr[arr.length-1]] = input[name];
	}
	
	chart = new google.visualization[input.chartType](document.getElementById(container));
  chart.draw(data, chartOptions);

}
