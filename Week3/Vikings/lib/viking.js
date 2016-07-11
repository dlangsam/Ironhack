"use strict"

class Viking{
	constructor(name, health, strength){
		this.name = name;
		this.health = health;
		this.strength = strength;
	}
	/*attack(otherViking, turns){
		if(this.health < otherViking.strength){
			console.log(this.name + " too weak to fight.")
			this.rest(90);
			return;
		}
		if(otherViking.health < tjos.strength){
			console.log(otherViking.name + " too weak to fight.")
			otherViking.rest(90);
		}
		if(this.strength > otherViking.strength){
			otherViking.health -= this.strength;
			console.log("Round:" + turns + " " +this.name + " hurts " + otherViking.name);
		}else{
			this.health -= otherViking.strength;
			console.log("Round:" + turns +" " + otherViking.name + " hurts " + this.name);
		}
		
	}*/
	rest(napTime){
		this.health += napTime; 
	}

	attack(other){
		if(this.strength > other.strength){
			other.health -= this.strength;
			//console.log("Round:" + turns + " " +this.name + " hurts " + otherViking.name);
		}else{
			this.health -= other.strength;
			//console.log("Round:" + turns +" " + otherViking.name + " hurts " + this.name);
		}
		
	}
	battleCry(){
		console.log("AAAAAAAaaaaataaaack!!!!!");
	}
}

module.exports = Viking