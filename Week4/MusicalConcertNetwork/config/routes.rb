Rails.application.routes.draw do
	  get '/', to: 'concerts#index'
	  get '/search', to: 'search#search'
	resources :concerts do
		resources :comments
	end
	#resources :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
