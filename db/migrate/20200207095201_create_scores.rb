class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|

      t.integer :score
      t.integer :round   
      t.timestamps
      
    end
      add_reference :scores, :match_user, foreign_key: true
  end

end
