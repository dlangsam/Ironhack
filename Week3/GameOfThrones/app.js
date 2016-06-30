"use strict"

var GOT = require("./lib/GOT.js")



var fs = require('fs');
function fileActions(err, file){ 
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);

    episodes.sort(function(a,b){
    return a.episode_number - b.episode_number
});
    var filteredEpisodes= episodes.filter(GOT.filterEpisodes)
    var jonEpisodes = episodes.filter(GOT.searchFor);


    // Created a variable called sorted episodes but the sort function sorted inplace.
     episodes.forEach(GOT.printEpisode);
     console.log("--------------");
     filteredEpisodes.forEach(GOT.printEpisode);
     console.log("--------------");
     jonEpisodes.forEach(GOT.printEpisode);
    
}
fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);


