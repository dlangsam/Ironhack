class ProjectsController < ApplicationController
	def index
		@projects_array = Project.order(created_at: "desc").limit(10)
		render 'index'
	end

	def show
		@my_project = Project.find(params[:id])
		render 'show'
	end
end
