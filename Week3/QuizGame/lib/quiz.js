"use strict"

var read = require('read');
var Questions = require("./questions.js");
var User = require("./user.js");

class Quiz{
	constructor(questions){
		this.questions = questions;
		this.i = 0;
		this.current_question;
		this.score = 0;
		this.bonusQuestion = Math.floor(Math.random()*this.questions.length);
		this.user = null; 
	}

	addUser(user){
		this.user = null;
	}


	askQuestion(question) {
		var options = {
    			prompt: question.question
		}
  		read(options, this.answeredRight.bind(this))

 	}
 	answeredRight(err, answer){

		if (this.current_question.answer === answer){
		
		    if (!this.current_question.answeredOnce){
				this.score += this.current_question.points;
				if(this.i === this.bonusQuestion){
					console.log("Congratulations, you answered the bonus question correct!");
					this.score += this.current_question.points;
				}
		    }
			this.i++;

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