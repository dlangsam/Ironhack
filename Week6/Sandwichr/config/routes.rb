Rails.application.routes.draw do
  devise_for :users
  root to: "static#index"
resources :sandwiches, only: [:index, :show], controller: "sandwich_views"
	scope "/api" do
 		resources :ingredients, only: [:create, :destroy, :show]

  		resources :sandwiches, except: [:new, :edit]

  		post '/sandwiches/:id/ingredients/add', to: 'sandwiches#add_ingredient'
	end
end
