"use strict"
var read = require('read');
class Question{
	constructor(question, answer, id, points){
		this.question = question;
		this.answer = answer;
		this.id= id;
		this.points = points;
		this.answeredOnce = false;

	}
	// ask(){
	// 	var options = {
 //    			prompt: this.question
	// 		};
 //  		if(!read(options, this.answeredRight)){
 //  			setTimeout(this.ask(), 12000);
 //  		}
	// }
	// answeredRight(err, answer){
	// 	if (this.answer === answer)
	// 		return 1;
	// 	else
	// 		return 0;
	// }


};

module.exports = Question;

