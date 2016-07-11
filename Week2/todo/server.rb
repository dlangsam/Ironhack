#Inside of server.rb
require 'sinatra'
require 'sinatra/reloader'
# We're going to need to require our class files
require_relative('lib/task.rb')
require_relative('lib/todo_list.rb')
todo_list = TodoList.new("Devorah")
get "/" do
	"Hello"
end
get "/tasks" do 
	todo_list.load_tasks
	@tasks = todo_list.tasks
	
	erb(:task_index)
	
end

post "/new_task" do
	erb(:new_task)
end

post "/create_task" do
	added_task_description = params[:new_task]
	new_task = Task.new(added_task_description)
	todo_list.add_task(new_task)
	todo_list.save
	redirect to("/tasks")
end

post "/make_complete" do
	id = params[:id]
	task = todo_list.find_by_id(id.to_i)
	task.complete!
	todo_list.save
	redirect to ("/tasks")
end

post "/delete_task" do
	id = params[:id]
	todo_list.delete_task(id.to_i)
	todo_list.save
	redirect to ("/tasks")

end