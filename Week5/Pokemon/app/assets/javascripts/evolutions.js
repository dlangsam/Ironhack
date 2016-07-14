PokemonApp.Evolution  = class{
	constructor(id){
		this.id = id;
	}
	render(){
		console.log("Rendering evolutions:" + this.id);
		$.ajax({
			url: "/api/pokemon/" + this.id,
			success: function(response){
				console.log(response);
				$(".js-evolution-table").empty();
				//put response.eveolutions array into a modal
				
				response.evolutions.forEach(function(evo){
					var html = $(`<dt>Name</dt><dd>${evo.to}</dd>`);
					var image = $("<dd></dd>");
					var pokemon = new PokemonApp.Pokemon(evo.resource_uri);
					var id = pokemon.id;
					var evoURL = "/api/pokemon/" + id;
					$.ajax({
						url: evoURL,
						success: function(response){
							console.log(response);
							var sprite = new PokemonApp.Sprite(response.sprites[0].resource_uri, image);
							sprite.render();
							
						}
					});
					$(".js-evolution-table").append(html);
					$(".js-evolution-table").append(image);
				});
				
				$(".js-evolution-modal").modal("show");
			}		
		});
	};
}


$(document).on("ready", function(){
	$(".js-evolutions").on("click", function (event){
		var $button = $(event.currentTarget);
		var id = $button.data("id");
		console.log("Button: " + id);

		var evolution = new PokemonApp.Evolution(id);
		evolution.render();

		//show a new modal
	});
});