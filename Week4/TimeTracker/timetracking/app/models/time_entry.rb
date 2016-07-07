class TimeEntry < ApplicationRecord
	
	validates  :hours, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :minutes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :date, presence: true
	
	belongs_to :project
	def change
		create_table :time_entries do |t|
			t.integer  :project_id
			t.integer  :hours
			t.integer  :minutes
			t.text 	   :comments
			t.datetime :date
			t.timestamps
		end
	end
end
