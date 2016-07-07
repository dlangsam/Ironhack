class ChangeDateTypeInTimeEntries < ActiveRecord::Migration[5.0]
  def change
  	change_column :time_entries, :date, :datetime
  end
end
