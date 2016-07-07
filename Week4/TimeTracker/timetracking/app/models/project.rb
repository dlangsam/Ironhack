class Project < ApplicationRecord
	validates :name, presence: true,  uniqueness: true, length: { maximum: 30 }, format: { with: /[a-zA-Z]/}

  	validates_associated :time_entries
	has_many :time_entries

	def self.clean_old
		old_projects = Project.where("updated_at < ?", 1.week.ago )
		old_projects.destroy_all
	end
end
