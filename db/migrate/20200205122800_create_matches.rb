class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|

      t.timestamps
      
    end

    add_reference :matches, :game, foreign_key: true

  end
end
