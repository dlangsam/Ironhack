class SearchController < ApplicationController

	def price
		@price = params[:price]
		@concerts = Concert.where("price <= ?", @price)
			               .where("date >= ?", Date.today.to_datetime)
			               .order("price")
		@future_concerts = Concert.where("date > ?", Date.today.to_datetime).where("date < ?", Date.today.to_datetime + 1.month)
		render 'results'
	end

	def popularity
		all_concerts = Concert.where("date >= ?", Date.today.to_datetime).sort_by do |concert|
			-concert.comments.count
		end
		@concerts = all_concerts[0..9]

		@future_concerts = Concert.where("date > ?", Date.today.to_datetime).where("date < ?", Date.today.to_datetime + 1.month)
		render 'results' 
	end

	
end
