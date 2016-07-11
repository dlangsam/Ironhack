"use strict"

var Viking = require("./viking.js")
var Saxons = require("./saxons.js")

var Viking = require("./viking.js");
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}


class Battle{
	constructor(vikings, saxons){
		this.vikings = vikings;
		this.saxons = saxons;
	}
	getRanddomSaxon(){
		var numSax = this.saxons.length;
		var index = Math.floor(Math.random() * numSax);
		return this.saxons[index]
	}
	fightBattle(){
		this.vikings.forEach(Viking.battleCry);
		numBattles = getRandomInt(5,8)
		for(var i = 0; i < numBattles; i++){
			var attackedSaxon = getRanddomSaxon
			if(attackedSaxon == null)return;
			this.vikings.forEach(function(){
				var attackedSaxon = getRanddomSaxon;;
				viking.attack(attackedSaxon);
				if(attackedSaxon.health <= 0){

				}

			}


				

		}


	}


}