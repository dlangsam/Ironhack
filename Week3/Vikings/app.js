"use strict"

var Viking = require("./lib/viking.js")
var PitFight = require("./lib/pitFight.js")
var Saxons = require("./lib/saxons.js")

var carlViking = new Viking("Carl", 100, 10);
var edViking = new Viking("Ed", 100, 8);
var beverlyViking = new Viking("Beverly", 100, 9);
var jackViking = new Viking("Jack", 100, 8);
var peteViking = new Viking("Pete", 100, 11);


var mySaxons = [];

while(mySaxons.length < 0){
	mySaxons.push(new Saxon());
}


//carlViking.attack(edViking);
//carlViking.attack(beverlyViking);
var myVikings = [carlViking, edViking, beverlyViking, 
jackViking, peteViking];

var myPitFight = new PitFight(myVikings);

myPitFight.attackEachother()


