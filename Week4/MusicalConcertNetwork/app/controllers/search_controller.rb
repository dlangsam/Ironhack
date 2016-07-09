class SearchController < ApplicationController

	def search
		@price = params[:price]
		@concerts = Concert.where("price < ?", @price)
			               .where("date >= ?", Date.today.to_datetime)
			               .order("price")
		@future_concerts = Concert.where("date > ?", Date.today.to_datetime).where("date < ?", Date.today.to_datetime + 1.month)
		render 'results'
	end

	
end
