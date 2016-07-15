if (window.SpotifyApp === undefined){
	window.SpotifyApp = {};
}
SpotifyApp.init = function(){
	console.log("Spotify App online");
};

$(document).on('ready', function(){
	SpotifyApp.init();
});