$(document).ready(function(){
	$('.js-ingredient').on('click', function(){
		var id = $(this).data('id');
		var s_id = $('.sandwich').data('id');
		console.log(id);
		console.log("Sandwich id:" + s_id);
		console.log("Add an ingredient");
		$.ajax({
			method: "post",
			url: "/api/sandwiches/" + s_id + "/ingredients/add/",
			data: {ingredient_id: id},
			success: updateSandwich,
			failure: function(error){
				console.log(error);
			}
		});
	});

	function updateSandwich(response){
		console.log(response)
		$('.js-cal').html(response.total_calories);
		$('.js-ingredient-list').append(`<li>${response.ingredients[response.ingredients.length - 1].name}</li>`);
	}

});