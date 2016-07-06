class AddColumnsToTimeEntries < ActiveRecord::Migration[5.0]
  def change
  	add_column :time_entries, :hours, :integer
  	add_column :time_entries, :minutes, :integer
  	add_column :time_entries, :comments, :text
  	add_column :time_entries, :datetime, :date
  end
end
