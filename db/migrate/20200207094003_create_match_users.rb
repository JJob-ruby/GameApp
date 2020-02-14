class CreateMatchUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :match_users do |t|
      t.integer :no_of_players
      t.date :date
      t.timestamps
    end

   add_reference :match_users, :match, foreign_key: true
   add_reference :match_users, :user, foreign_key: true
   add_index :match_users, [:match_id, :user_id], unique: true

  end
end
