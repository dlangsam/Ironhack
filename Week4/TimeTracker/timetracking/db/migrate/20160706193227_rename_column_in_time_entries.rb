class RenameColumnInTimeEntries < ActiveRecord::Migration[5.0]
  def change
  	rename_column :time_entries, :datetime, :date
  end
end
