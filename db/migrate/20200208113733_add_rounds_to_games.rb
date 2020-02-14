class AddRoundsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :rounds, :integer, null: false
  end
end
