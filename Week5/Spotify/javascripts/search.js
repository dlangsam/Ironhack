SpotifyApp.Search  = class{
	constructor(searchTerm){
		this.searchTerm = searchTerm;
	}
	render(){
		console.log("Rendering search for song: " + this.searchTerm);
		$.ajax({
			url: "https://api.spotify.com/v1/search?type=track&query=$" + this.searchTerm,
			success: loadSongResults,
			error: function(error){
				console.log("Error loading song");
			}				
		});		
	}
}

SpotifyApp.SearchById = class{
	constructor(searchTerm){
		this.searchTerm = searchTerm;
	}
	render(){
		console.log("Rendering search for song: " + this.searchTerm);
		$.ajax({
			url: "https://api.spotify.com/v1/tracks/" + this.searchTerm,
			success: loadSongResult,
			error: function(error){
				console.log("Error loading song");
			}				
		});		
	}
}

function loadSongResults(response){
	if (response.tracks.items.length === 0){
		return;
	}else{
		loadSongResult(response.tracks.items[0]);
	}
}
function loadSongResult(response){
	console.log(response);

		var artists = response.artists; //this is an array
		var title = response.name;
		var albumCover = response.album.images.length > 0 ? response.album.images[0].url : "";
		var artistHTML = "";
		artists.forEach(function(artist){
			artistHTML += `<button class = "js-artist-name" data-name = "${artist.name}">
			${artist.name}</button>`;
		});
		var image = `<img src = ${albumCover}>`
		$('.artist').html(artistHTML);
		$('.title').text(title);
		$('.cover').html(image);

		var audioURL = response.preview_url;
		$('.js-player').attr("src", audioURL);
		$('.btn-play').removeClass('disabled');
		 $('progress').prop("value",  0);
		
	
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
