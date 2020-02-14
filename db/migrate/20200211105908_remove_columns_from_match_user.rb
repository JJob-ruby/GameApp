class RemoveColumnsFromMatchUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :match_users, :no_of_players, :integer
    remove_column :match_users, :date , :date
  end
end
