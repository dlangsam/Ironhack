Rails.application.routes.draw do
	get "/contacts", to: "contacts#index" 
	get "/contacts/new", to: "contacts#new"
	post "/contacts", to: "contacts#create"
	get "/contacts/show/:index", to: "contacts#show"
	get "/projects", to: "projects#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
