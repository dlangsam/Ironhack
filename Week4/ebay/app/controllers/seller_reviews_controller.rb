class SellerReviewsController < ApplicationController

	def index
		seller = User.find(params[:user_id])
	

		unless seller
			render json: {error: "seller not found" }, status: 404
			return
		end

		seller_reviews = seller.seller_reviews

		render json: seller.to_json(include: [:seller_reviews])
	end
end


