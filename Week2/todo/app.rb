 require_relative("lib/todo_list.rb")

todo_list = TodoList.new("Devorah")	
todo_list.load_tasks
tasks = todo_list.tasks
tasks.each do |task|
	puts task.content
end

 # task = Task.new("grocery shop")
 #      task2 = Task.new("buy shoes")
 #      task3 = Task.new("walk dog")
 #      @list.add_task(task)
 #      @list.add_task(task2)
 #      @list.add_task(task3)
 #      puts "here"
 #      puts @list.find_by_id(2).content
 #      @list.save
 #      