class ConcertsController < ApplicationController
	def index
		@concerts = Concert.where("date = ?", Date.today.to_datetime)
		@future_concerts = Concert.where("date > ?", Date.today.to_datetime).where("date < ?", Date.today.to_datetime + 1.month)
		render 'index'
	end
	def show
		@concert = Concert.find(params[:id])
		render 'show'
	end
	def new
		@concert = Concert.new
		render 'new'
	end
	def create
		@concert = Concert.new(concert_params)

		if @concert.save
			redirect_to "/concerts"
		else
			render 'new'
		end
	end

	private
	def concert_params
		params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
	end
end
