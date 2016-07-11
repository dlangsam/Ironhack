"use strict"

function countColors(color, colorArray){
	var count = 0;
	colorArray.forEach(function(colorFromArray){
		if(color === colorFromArray){
			count++;
		}
	});
	return count;

}

module.exports = countColors;