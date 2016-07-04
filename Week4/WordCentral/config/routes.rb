Rails.application.routes.draw do

	 get '/', to: 'site#home'
	 get '/text_inspections/new', to: 'text_inspection#new'
	 post '/text_inspections', to: 'text_inspection#create'
	 get '/asciis/new', to: 'asciis#new'
	 post '/asciis', to: 'asciis#create'
	 get '/quotes/new', to: 'quotes#new'
	 post '/quotes', to: 'quotes#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
