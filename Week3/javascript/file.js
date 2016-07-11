//file.js


var countColors = require("./lib/count_colors.js");

var colorsArray = ["black", "purple", "charteuse", "indigo",
 "magenta", "charteuse", "indigo", "scarlet", "indigo" ];


console.log("Testing countColors function");
console.log( countColors("indigo", colorsArray) === 3);
console.log( countColors("scarlet", colorsArray) === 1);
console.log( countColors("pink", colorsArray) === 0);



var numbers = '80:70:90:100'

function averageColon(numberString){
	numberString = typeof numberString !== 'undefined' ? numberString : "0";
	//break it into an array
	var re = /[:]|[&]/;
	var numbers = numberString.split(re);

	var sum = numbers.reduce(function(total, number){
		return parseInt(total) + parseInt(number);

	});
	return sum/numbers.length;
}

console.log(averageColon(numbers) === 85);
console.log(averageColon() === 0);
console.log(averageColon("80:70:90&100") === 85);
console.log(averageColon("80&70&90&100") === 85);

