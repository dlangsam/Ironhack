"use strict"

var read = require('read');
var Questions = require("./questions.js");

class Quiz{
	constructor(questions){
		this.questions = questions;
		this.i = 0;
		this.current_question;
		this.score = 0;
	}


	askQuestion(question) {
		var options = {
    			prompt: question.question
		}
  		read(options, this.answeredRight.bind(this))

 	}
 	answeredRight(err, answer){

		if (this.current_question.answer === answer){
			this.i++;
			if (!this.current_question.answeredOnce)
				this.score += this.current_question.points;

		}else{
			if (!this.current_question.answeredOnce)
				this.score -= this.current_question.points;
		}
		this.current_question.answeredOnce = true;
		if(this.i < this.questions.length){
			this.runQuiz();
		}else{
			console.log("Final score: " + this.score);
		}
		
		
	}
 	runQuiz(){
 		console.log("Current score: " + this.score);
 		this.current_question = this.questions[this.i];
 		this.askQuestion(this.questions[this.i]);
	}

};

module.exports = Quiz;