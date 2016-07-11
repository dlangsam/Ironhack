require 'time'
class Task
    attr_reader :content, :id, :completed, :created_at, :updated_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @completed = false
        @created_at = Time.now
        @updated_at = nil
    end

    def complete?
    	@completed
    end
    def complete!
    	@completed = true
    end
    def make_incomplete!
    	@completed = false
    end

    def update_content! (new_content)
    	@content = new_content
    	@updated_at = Time.now
    end

    
end