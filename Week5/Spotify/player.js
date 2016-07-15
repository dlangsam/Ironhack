SpotifyApp.Player  = class{
	constructor(searchTerm){
		this.searchTerm = searchTerm;
	}
	render(){
		console.log("Rendering search for song: " + this.searchTerm);
		$.ajax({
			url: "https://api.spotify.com/v1/search?type=track&query=$" + this.searchTerm,
			success: loadSongResult,
			error: function(error){
				console.log("Error loading song");
			}
				
		});
			
	}


}

$(document).on('ready', function(){
	$('.btn-play').on('click', function (event){
		
		console.log("Playing song");
		$('.js-player').trigger('play');
	});
});