$(document).on('ready', function(){
	console.log("HERE");
	$('form').submit(function(event){
      event.preventDefault();
 
      var myURL = "https://api.spotify.com/v1/search?type=artist&query=$" + $('.js-name').val();
        $.ajax({type: "GET",
        		url: myURL,
        		success: showArtist,
        		error: handleError

        });

  });

$('.results').on('click', '.artist-result', function(event){

  var button =  event.currentTarget;
  var id = $(button).data("id");
  var myURL = `https://api.spotify.com/v1/artists/${id}/albums`
   results =       $.ajax({type: "GET",
            url: myURL,
            success:function(response){
              showAlbums(response, button)
            } ,
            error: handleError

        });
   console.log(results);

 
});


$('.results').on('click', '.albums-btn', function(event){
    var button =  event.currentTarget;
    var id = $(button).data("id");

    var myURL = `https://api.spotify.com/v1/albums/${id}/tracks`
   results =       $.ajax({type: "GET",
            url: myURL,
            success: showTracks,
            error: handleError

        });
   console.log(results);

  });

function showAlbums(response, button){
        $("#list").remove();
  

        
        console.log(response);
        html = "<ul id = 'list'>";
        response.items.forEach(function(album){
          html += `<li>
          <button type="button" class="albums-btn" data-toggle="modal" data-target="#myModal" 
        data-id = ${album.id}>
          ${album.name}
        </button></li>`;
          //console.log(album.name);
        });
        html +="<ul>"
        $(button).parent().append(html);
       

}

function showTracks(response){
  console.log(response);
  var html = "<ul>";
  response.items.forEach(function(track){
    html += `<li><a href = "${track.preview_url}" target=”_blank”>${track.name}</a></li>`;
  });
  html += "</ul>";
  $(".modal-body").html(html);

}


    function handleError(error){
      console.log(error);
      alert("There was an error");
    }

    function showArtist(response){
      var searchResults = response;
   		 var html = "";
      searchResults.artists.items.forEach(function (result){
        html += `<li><button class = "artist-result" data-id = ${result.id}> Name: ${result.name}</button>`;  
        if(result.images.length > 0){
        	html += `<br><div class = "artist-photo"><img src = ${result.images[0].url} width = 89 height = 160></div>`
        }
        html  +=`</li>`;  
      });
      $('.results').append(html);
    
    }   
   

});