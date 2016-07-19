class SandwichesController < ApplicationController
	def index
		sandwiches = Sandwich.all
		render json: sandwiches
	end

	def create
		sandwich = Sandwich.create(sandwich_params)
		render json: sandwich
	end

	def show
		sandwich = Sandwich.find_by(id: params[:id])
		ingredients = sandwich.ingredients

		unless sandwich
			render json: {error: "sandwich not found" }, status: 404
			return
		end

		render json: sandwich.to_json(:include => :ingredients)
	end

	def update
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json: {error: "sandwich not found" }, status: 404
			return
		end

		sandwich.update(sandwich_params)
		render json: sandwich
	end

	def destroy
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json:  {error: "sandwich not found" }, status: 404
			return
		end

		sandwich.destroy
		head :no_content
	end

	def add_ingredient
		ingredient_id = params[:ingredient_id]

		ingredient = Ingredient.find(ingredient_id)
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json:  {error: "sandwich not found" }, status: 404
			return
		end
		sandwich.ingredients.push(ingredient)
		sandwich.total_calories += ingredient.calories;
		sandwich.save

		render json: sandwich.to_json(:include => :ingredients)
	end


	private
	def sandwich_params
		# { sandwich: { name: "Buffalo", bread_type: "Wheat" } }
		params.require(:sandwich).permit(:name, :bread_type, :total_calories)
	end
end
