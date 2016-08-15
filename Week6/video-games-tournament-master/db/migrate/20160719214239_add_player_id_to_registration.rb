class AddPlayerIdToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :player_id, :integer
  end
end
