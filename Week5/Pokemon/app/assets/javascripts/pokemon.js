// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
PokemonApp.Pokemon  = class{
	constructor(pokemonUri){
		this.id = PokemonApp.idFromUri( pokemonUri );
	}
	render(){
		console.log("Rendering pokemon: #" + this.id);
		$.ajax({
			url: "/api/pokemon/" + this.id,
			success: loadPokemonModal
				
		});
	};
}

function loadPokemonModal(response){
	console.log("Pokemon info:");
	console.log(response);
	$(".js-pkmn-name").text(response.name);
	$(".js-pkmn-number").text(response.pkdx_id);
	$(".js-pkmn-ht").text(response.height);
	$(".js-pkmn-wt").text(response.weight);
	$(".js-pkmn-hitpts").text(response.hp);
	$(".js-pkmn-attack").text(response.attack);
	$(".js-pkmn-defense").text(response.defense);
	$(".js-pkmn-sp-attack").text(response.sp_atk);
	$(".js-pkmn-sp-defense").text(response.sp_def);
	$(".js-pkmn-speed").text(response.speed);
	$(".js-evolutions").data('id', response.national_id);
	var typeList = "";
	var types = response.types;
	types.forEach(function(type){
		typeList += type.name + " ";
	});
	$(".js-pkmn-types").text(typeList);
	var spriteURI = response.sprites[0].resource_uri;
	var sprite = new PokemonApp.Sprite(spriteURI, $(".js-pkmn-image") );
	sprite.render();

			
	var description = PokemonApp.lastestDescription(response.descriptions)
	var descriptionURL = description.resource_uri;
	$.ajax({
		url: descriptionURL,
		success: function(descResponse){
			$(".js-pkmn-desc").text(descResponse.description);
			$(".js-pokemon-modal").modal("show");
		}
	});			
}


PokemonApp.lastestDescription = function(descriptions){
	descriptions.sort(function(a,b){
		aNumber = a.name.split("_")[2];
		bNumber = b.name.split("_")[2];
		return bNumber - aNumber;
	});
	return descriptions[0];

}

PokemonApp.idFromUri = function(pokemonUri){
	var uriSegments = pokemonUri.split("/");
	var secondLast = uriSegments.length - 2;
	return uriSegments[secondLast];
}

$(document).on("ready", function(){
	$(".js-show-pokemon").on("click", function (event){
		var $button = $(event.currentTarget);
		var pokemonUri = $button.data("pokemon-uri");

		var pokemon = new PokemonApp.Pokemon(pokemonUri);
		pokemon.render();
	});
});