require_relative("task.rb")
require('yaml/store')


class TodoList
    attr_reader :tasks, :user
    def initialize(name)
    	@user = name
        @tasks = []
        @todo_store = YAML::Store.new("./public/tasks.yml")
    end
    def add_task(task)
    	@tasks.push(task)
    end
    def delete_task(id)
    	@tasks.delete_if{|task| task.id == id }
    end

    def find_by_id(id)
        @tasks.find { |the_task| the_task.id == id }
    end

    def sort_tasks(ascending)
    	if ascending
    		sorted_tasks = @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
    	else
    		sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
   		end
    end

    def save
  		@todo_store.transaction do 
      		@todo_store[@user] = @tasks
 		 end
 	end
 	 def load_tasks
 	 	contents= YAML.load_file("./public/tasks.yml")
        @tasks = contents[@user]
  
 	 end


end