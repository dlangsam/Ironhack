class ProductsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@products_array = @user.products.order(created_at: "desc")
		render 'index'
	end
	def show
		@user = User.find(params[:user_id])
		@product = @user.products.find(params[:id])
		render 'show'
	end
	
	def new
		@user = User.find(params[:user_id])
		@product = @user.products.new
		render 'new'
	end
	def create

		@user = User.find(params[:user_id])
		@product = @user.products.new(product_params)

		if @product.save
			redirect_to "/users/#{@user.id}/"
		else
			render 'new'
		end
	end
	def destroy
		@user = User.find(params[:user_id])
		@product = @user.products.find(params[:id])
		@product.destroy
		redirect_to user_path(@user)
	end

	private
	def product_params
		params.require(:product).permit(:title, :description, :deadline)
	end
end
