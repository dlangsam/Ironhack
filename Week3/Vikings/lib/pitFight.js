"use strict"



class PitFight{
	constructor(vikings){
		this.vikings = vikings;
	}

	attackEachother(){
		var turns = 0;
		var numOfVikings = this.vikings.length;
		var i = Math.floor(Math.random() * numOfVikings);
		var j = Math.floor(Math.random() * numOfVikings);
		if(i === j){
			console.log("No fight today")
		}else{
			console.log(this.vikings[i].name + " and " + this.vikings[j].name  + " fight" );
			while(turns  <  3 && this.vikings[i].heath > this.vikings[j].strength &&
				this.vikings[j].heath > this.vikings[i].strength
			){

				this.vikings[i].attack(this.vikings[j]);
				this.vikings[i].rest(20);
				this.vikings[j].rest(20);
				turns++;
			}
		}
	}
}

module.exports = PitFight;


