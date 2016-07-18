SpotifyApp.ArtistSearch  = class{
	constructor(searchTerm){
		this.searchTerm = searchTerm;
	}
	render(){
		console.log("Rendering search for name: " + this.searchTerm);
		var search = this;
		$.ajax({
			url: "https://api.spotify.com/v1/search?type=artist&query=$" + this.searchTerm,
			success: function(response){
				loadArtistResult(response, search.searchTerm);
			},
			error: function(error){
				console.log("Error loading song");
			}				
		});		
	}


}

function loadArtistResult(response, name){
	console.log(response);

	var photoURL = response.artists.items[0].images[0].url;
	var photoHTML = `<img src="${photoURL}">`;
	var genres = response.artists.items[0].genres;
	var genreHTML = `<ul>`;
	genres.forEach(function(genre){
		genreHTML += `<li>${genre}</li>`
	});
	genreHTML += `</ul>`;
	$('.modal-artist').text(name);
	$('.modal-photos').html(photoHTML);
	$('.modal-genres').html(genreHTML);
	$('.modal-followers').text(response.artists.items[0].followers.total);
	$('.modal-popularity').text(response.artists.items[0].popularity);
	$('.js-artist-modal').modal("show");
}

$(document).on('ready', function(){
	$('.artist').on('click', '.js-artist-name', function(event){
		event.preventDefault();
  		var button =  event.currentTarget;
  		console.log(button);
  		var artist = $(button).data("name");
		console.log("Searching artist: " + artist);
		var artistSearch = new SpotifyApp.ArtistSearch(artist);
		artistSearch.render();
	});
});
