class AddNoOfPlayersToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :number_of_players, :integer, null: false
  end
end
