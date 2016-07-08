class UsersController < ApplicationController
	def index
		@users = User.order(name: "desc")
		render 'index'
	end
	def show
		@user = User.find(params[:id])
		@products = @user.products
		render 'show'
	end
	def new
		@user = User.new
		render 'new'
	end
	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to "/users"
		else
			render 'new'
		end
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end
	private
	def user_params
		params.require(:user).permit(:name, :email)
	end
end
