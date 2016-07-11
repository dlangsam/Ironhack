"use strict"

var Question = require("./lib/questions.js");
var Quiz = require("./lib/quiz.js");


var q1 = new Question("What is 7*7?", "49", 1, 3);
var q2 = new Question("What is the capital of New York?", "Albany", 2, 5);
var q3 = new Question("Who was the first president of the USA?", "George Washington", 3, 1);
var q4 = new Question("What is the square route of 121?", "11", 4, 3);
var q5 = new Question("How many states are in the USA?", "50", 5, 2);
var questions = [q1, q2, q3, q4, q5];
var theQuiz = new Quiz(questions);
theQuiz.runQuiz();