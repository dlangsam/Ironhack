"use strict"

var Question = require("./lib/questions.js");
var Quiz = require("./lib/quiz.js");


var q1 = new Question("What is 7*7?", "49", 1, 3);
var q2 = new Question("What is the capital of New York?", "Albany", 2, 5);
var q3 = new Question("Who was the first president of the USA?", "George Washington", 3, 1);

var questions = [q1, q2, q3];
var theQuiz = new Quiz(questions);
theQuiz.runQuiz();