class ContactsController < ApplicationController
	def index
		@contacts = Contact.order("name ASC")
		render 'index'
	end
	def new
		render 'new'
	end
	def create

    	contact = Contact.new(
     			 :name => params[:contact][:name],
     			 :address => params[:contact][:address],
     			 :phone_number => params[:contact][:phone],
     			 :email => params[:contact][:email])
    	email_pattern = /^\w+@\w+\.[A-Za-z]+$/
    	phone_pattern = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
		if (contact.name != "" && contact.address != "" && (contact.email =~ email_pattern) != nil &&
		 (contact.phone_number =~ phone_pattern) != nil)
    			# Now we save the contact
    			contact.save
    	        redirect_to("/contacts")
    	else
    		redirect_to ("/contacts/new")
   		end
	end
	def show 
		the_id = params[:index]
		@contact = Contact.find_by(id: the_id)

		render 'show'
	end
end
