SpotifyApp.MoreResults  = class{
	constructor(searchTerm){
		this.searchTerm = searchTerm;
	}
	render(){
		console.log("Rendering search for more results: " + this.searchTerm);
		$.ajax({
			url: "https://api.spotify.com/v1/search?type=track&query=$" + this.searchTerm,
			success: loadResults,
			error: function(error){
				console.log("Error loading song");
			}				
		});		
	}


}

function loadResults(response){
	console.log(response);
	var results = `<ul>`
	response.tracks.items.forEach(function(result){
		results += `<li><button class="js-song" data-id = "${result.id}">${result.name}</button> ${result.artists[0].name}</li>`
	});
	results += `</ul>`;
	$('.more-results').html(results);
	$('.js-more-modal').modal('show');
}




$(document).on('ready', function(){
	$('.js-more-results').submit(function (event){
		event.preventDefault();
		console.log("Searching song");
		var songName = $('.js-search-input').val();
		console.log(songName);
		var more = new SpotifyApp.MoreResults(songName);
		more.render();
	});

	$('.more-results').on('click', '.js-song', function(event){
		event.preventDefault();
  		var button =  event.currentTarget;
		var id = $(button).data("id");
		$('.js-more-modal').modal('hide');
		var search = new SpotifyApp.SearchById(id);
		search.render(); 
	});
});