"use strict"

class Car{
	constructor(model, noise){
		this.model = model;
		this.noise = noise;
		this.numWheels = 4
	}
	makeNoise(){
		console.log(this.noise);
	}
};

module.exports = Car;