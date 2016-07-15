PokemonApp.Sprite  = class{
	constructor(spriteUrl, image_holder){
		this.url = spriteUrl;
		this.image_holder = image_holder;
	}

	render(){
		console.log("Rendering sprite");
		var theSprite = this;
		$.ajax({
			url: this.url,
			success: function(response){
				createSprite(response, theSprite.image_holder);				
			},
			error: function(error){
				console.log(error);
			}		
		});		 
	}


	
}
	function createSprite(response, image_holder){
 		var imageTag = `<img src = "http://pokeapi.co/${response.image}">`;
 		image_holder.html(imageTag);
	}
