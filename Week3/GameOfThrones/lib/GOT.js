function printEpisode(episode){
	 console.log("Title: " + episode.title + " Episode #: " + episode.episode_number +"\n"
 	+ episode.description + "\n" + "Rating " + episode.rating + getStar(episode));
}

function getStar(episode){
	rating = episode.rating;
	var stars = ("");
	for (var  i = 0;  i < rating; i++){
		stars = stars + "*";
	}
	return stars;
}


function filterEpisodes(episode){
	if (episode.rating > 8.5)
		return true;
	else 
		return false;	
}

function searchFor(episode){

	if (episode.description.indexOf("Jon Snow") === -1)
		return false;
	else
		return true;	
}


module.exports = {
	printEpisode,
	filterEpisodes,
	searchFor
}







