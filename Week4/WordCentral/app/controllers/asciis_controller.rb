class AsciisController < ApplicationController
	def new
		render 'new'
	end

	def create
		 @text = params[:asciis][:user_text]
		 @word_printer = Artii::Base.new
		 render 'art'
	end
end