$(document).on("ready", function(){
	var savedImages = ",,";
	var $color_button = $('.color-changer');

	function changeColor(event){
  	var color = $(event.target).data('color');
  	 $("body").css("background-color", color);
  	 window.localStorage.setItem("bg-color", color);
	}
	$color_button.on("click", changeColor);
	function loadDefaultColor(){

  		if (window.localStorage.getItem("bg-color")){
    		var savedColor = window.localStorage.getItem("bg-color");
    		$("body").css("background-color", savedColor);

  		}

  		if (window.localStorage.getItem("saved-images")){
    		savedImages = window.localStorage.getItem("saved-images");
    		var imageURLs = savedImages.split(",");
    		imageURLs.forEach(function(url){
    			html = `<img src = "${url}">`;
				$(".js-images").append(html);

    		});

  		}

	}
	loadDefaultColor();
	$(".url-button").on("click", addImage);
	function addImage(){

		var url = prompt("Enter the image url:");
		html = `<img src = "${url}">`;
		$(".js-images").append(html);
		console.log(html);
		savedImages += "," + url;
		window.localStorage.setItem("saved-images", savedImages);


	}

	$('#play').on('click', function(){
  		$('#vid1').trigger('play');
	});



});