class BidsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@product = @user.products.find(params[:product_id])
		@bid = @product.bids.new
		render 'new'
	end
	def create
		@user = User.find(params[:user_id])
		@product = @user.products.find(params[:product_id])
		@bidding_user = User.find_by(email: params[:user_email])
		@bid = @product.bids.new(bid_params)
		@bid.user_id = @bidding_user.id
		@bid.product_id = @product.id
		if @bid.save
			redirect_to "/users/#{@user.id}/products/#{@bid.product_id}"
		else
			render 'new'
		end

	end
	private
	def bid_params
		params.require(:bid).permit(:amount)
	end
end
