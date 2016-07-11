require_relative("../lib/task.rb")

RSpec.describe do "Task Tests"
before :each do
    @task = Task.new("fold laundry")
  end
	describe "#complete? test"  do 
    it "checks whether a newly created test is not complete"  do 
     
      expect( @task.complete?).to eq(false)
  	end
  end 

  describe "#complete! test"  do 
    it "checks whether a completed test then comes across as complete"  do 
     	@task.complete!
      expect( @task.complete?).to eq(true)
  	end
  end 

  describe "#make_incomplete! test"  do 
    it "checks whether a completed test that is then made incomplete is no longer complete"  do 
     	@task.complete!
      	expect( @task.complete?).to eq(true)
      	@task.make_incomplete!
      	expect( @task.complete?).to eq(false)
  	end
  end

  describe "#created_at time test"  do 
    it "checks whether a newly created task date is later than an older task"  do 
     	 task2 = Task.new("walk dog")
     	 puts @task.created_at
     	 expect( task2.created_at).to be > @task.created_at   	
  	end
  end 

  #  describe "#update_content! test"  do 
  #   it "checks whether a task's content is correctly updated"  do 
  #    	@task.update_content!("wash and fold laundry")
  #    	 expect( @task.content).to eq("wash and fold laundry") 
  #    	 expect( @task.updated_at).to be > @task.created_at    	
  # 	end
  # end 


end