SpotifyApp.Search  = class{
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
function loadSongResult(response){
	console.log(response);
	if (response.tracks.items.length === 0){
		return
	} else{
		var artists = response.tracks.items[0].artists; //this is an array
		var title = response.tracks.items[0].name;
		var albumCover = response.tracks.items[0].album.images.length > 0 ? response.tracks.items[0].album.images[0].url : "";
		var artistString = "";
		artists.forEach(function(artist){
			artistString += artist.name + " ";
		});
		var image = `<img src = ${albumCover}>`
		$('.author').text(artistString);
		$('.title').text(title);
		$('.cover').html(image);

		var audioURL = response.tracks.items[0].preview_url;
		$('.js-player').attr("src", audioURL);
		$('.btn-play').removeClass('disabled');

		
	}
}

$(document).on('ready', function(){
	$('.js-song-search').submit(function (event){
		event.preventDefault();
		console.log("Searching song");
		var songName = $('.js-search-input').val();
		console.log(songName);
		var search = new SpotifyApp.Search(songName);
		search.render();
	});
});
