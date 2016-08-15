class AddTournamentIdToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :tournament_id, :integer
  end
end
