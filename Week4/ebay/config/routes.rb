Rails.application.routes.draw do
	

	scope "/api" do 
		resources :users do
			resources :seller_reviews 
			
		end
	end
	resources :users do
	 resources :products  do
	 	resources :bids
	 end
	 	
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
