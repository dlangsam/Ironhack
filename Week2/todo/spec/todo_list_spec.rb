require_relative("../lib/todo_list.rb")
require_relative("../lib/task.rb")

RSpec.describe do "Task Tests"
	before :each do
    	@list = TodoList.new("Devorah")
  	end
  	describe "#add_task"  do 
    it "checks whether an added_task increases the size of the tasks array"  do 
      task = Task.new("grocery shop")
      @list.add_task(task)
      expect( @list.tasks.length).to eq(1)
  	end
 	end 

 	describe "#delete_task"  do 
    it "checks whether a task has been deleted"  do 
      task = Task.new("grocery shop")
      task2 = Task.new("buy shoes")
      task3 = Task.new("walk dog")
      @list.add_task(task)
      @list.add_task(task2)
      @list.add_task(task3)
      @list.delete_task(task2.id)
      expect( @list.tasks.length).to eq(2)
      expect(@list.tasks).not_to include(task2)
      #expect( @list.tasks[1].content).to eq("walk dog")
  	end
 	end 

 	describe "#find_by_id"  do 
    it "checks whether the correct task is returned with find_by_id"  do 
      task = Task.new("grocery shop")
      task2 = Task.new("buy shoes")
      id_to_test = task2.id
      task3 = Task.new("walk dog")
      @list.add_task(task)
      @list.add_task(task2)
      @list.add_task(task3)
      expect( @list.find_by_id(id_to_test).content).to eq("buy shoes")
  	end
 	end 

 	describe "#sort_task"  do 
    it "checks whether a task has been sorted"  do 
      task1 = Task.new("grocery shop")
      task2 = Task.new("buy shoes")
      task3 = Task.new("walk dog")
      @list.add_task(task1)
      @list.add_task(task2)
      @list.add_task(task3)
      expect(@list.sort_tasks(true)).to eq([task3, task2, task1])
      expect(@list.sort_tasks(false)).to eq([task1, task2, task3])
  	end
 	end 

 	describe "#name test" do
 		it "checks that the user name is correct" do
 			new_list = TodoList.new("DML")
 			expect(new_list.user).to match("DML")
 		end

 	end
 
 	describe "#save test"  do 
    it "checks whether a test is saved"  do 
      task1 = Task.new("grocery shop")
      task2 = Task.new("buy shoes")
      task3 = Task.new("walk dog")
      @list.add_task(task1)
      @list.add_task(task2)
      @list.add_task(task3)
      @list.save

      new_list = TodoList.new("Devorah")
      new_list.load_tasks
      expect( @new_list.tasks.length).to eq(3)
  	end
 	end 








end