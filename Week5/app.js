$(document).on('ready', function(){

	$('button.js-button').on('click', function(){
		$('.container div').not('.js-button').fadeOut()
	});

	$('.unicorn button').on('click', function(){
		$('body').addClass('rainbow');

	});

});