


$(document).on('ready', function(){

		var quotes = [	"If you ask me Ren is a total fox.", 
					"Show me the money!",
					 "I'm like cat here, a no-name slob. We belong to nobody, and nobody belongs to us. We don't even belong to each other.",
					"Stop it, Mother. You'll give yourself a nosebleed.", 
					"If you let my daughter go now, that'll be the end of it. I will not look for you, I will not pursue you. But if you don't, I will look for you, I will find you, and I will kill you.",
					"You make me want to be a better man.", 
					"Help me, Obi-Wan Kenobi. You're my only hope."
]


	getQuote();
	function getQuote(){
		var x = Math.random() * quotes.length;
		$('.js-quote').html(quotes[parseInt(x)]);
	}
	$('button.random').on('click', getQuote);

	$('form').on('submit', function (e) {
  		if (e.which == 13) {
    	quotes.push($('input').val());
    	return false;    //<---- Add this line
  		}
	});


	 $('button.show').on('click', function(){
	 	$(this).toggleClass("show-quotes")
		
		var list = ""
		if ($(this).hasClass("show-quotes")){


		for(var i = 0; i < quotes.length; i++){
			list += "<li>" + quotes[i];
			var button = "<button class = quote value = " + i + "> Remove </button></li>";
			list += button;
		}
		$(this).text('Hide');
		}else{
			$(this).text('Show current quotes');
		}
		$('.quote-list').html(list);
	 });

	 $('button.quote').on('click', function(){
	 	var number = $(this).val();
	 	console.log(number);
	 	console.log("here")

	 });




});