class RemoveRoundsFromGame < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :rounds
  end
end
