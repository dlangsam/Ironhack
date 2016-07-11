Rails.application.routes.draw do
	  get '/', to: 'concerts#index'
	  get '/price', to: 'search#price'
	  get '/popularity', to: 'search#popularity'
	resources :concerts do
		resources :comments
	end
	#resources :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
