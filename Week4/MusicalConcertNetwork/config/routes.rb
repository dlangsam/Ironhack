Rails.application.routes.draw do
	  get '/', to: 'concerts#index'
	resources :concerts do
		resources :comments
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
