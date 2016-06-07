var user = {}
var responses = []


function question1() {
  var name = prompt('What is your name?')
  user.name = name
}

function question2(){
	var ans = prompt("Is Kevin Bacon the best actor ever?")
	if(ans.toLowerCase() === 'yes'){
		ans = true;
	}else if(ans.toLowerCase() === 'no'){
		ans = false;
	}else{
		alert("Please answer either yes or no");
		return question2();
	}
	responses.push(ans);
}

function question3(){
	var ans = prompt("Which of these movies does not star Kevin Bacon?: Footloose, The Breakfast Club, Tremors, or JFK?");
	ans = ans.toLowerCase();
	switch (ans){
		case "the breakfast club": 
			ans = true;
			break;
		case "footloose":
		case "tremors":
		case "jfk":
			ans = false;
			break;
		default:
			alert("Please choose from one of the four movies.");
			question3();
			break;
	}
	responses.push(ans);

}

function question4(){
	var ans = prompt("True or false: Kevin Bacon's first movie role was in Animal House.");
	if(ans.toLowerCase() === 'true'){
		ans = true;
	}else if(ans.toLowerCase() === 'false'){
		ans = false;
	}else{
		alert("Please answer either true or false");
		return question4();
	}
	responses.push(ans);
}

function question5(){
	var ans = prompt("What is the name of Kevin Bacon's tv show on Fox?");
	ans = ans.toLowerCase();
	if(ans === "the following" || ans === "follwoing"){
		ans = true;
	}else{
		ans = false;
	}
	responses.push(ans);
}

function question6(){
	var ans = prompt("Which of the following is the name of Kevin Bacon's Band: The Bacon Brothers, Bacon Love and Tunes, FOROSOCO, or Bacon Hits?");
	ans = ans.toLowerCase();
	switch (ans){
		case "the bacon brothers": 
			ans = true;
			break;
		case "bacon love and tunes":
		case "forosoco":
		case "bacon hits":
			ans = false;
			break;
		default:
			alert("Please choose from one of the four band names.");
			question6();
			break;
	}
	responses.push(ans);

}

function evaluate(responsesArray) {
	var totalRight = 0;
	var totalWrong = 0;
	for(i in responsesArray){
		if( responsesArray[i] === true){
			totalRight++;
		}else{
			totalWrong++;
		}
	}
	user.correctAnswers = totalRight;
	user.wrongAnswers = totalWrong;
	showResults();
}

function showResults() {
	if(user.totalWrong === 0){
		alert("Congrats " + user.name + "! You got all " + user.correctAnswers + " questions right. You are a Kevin Bacon expert!" );

	}else if (user.correctAnswers > user.wrongAnswers){
		alert("Good job " + user.name + "! You got " + user.correctAnswers + " questions right and " + user.wrongAnswers + " questions wrong.");
	}else{
		alert( "You got " + user.correctAnswers + " questions right and " + user.wrongAnswers + " questions wrong. Better watch more Kevin Bacon movies, " + user.name + ".");
	}

}



question1(); 
question2();
question3();
question4();
question5();
question6();
evaluate(responses);

