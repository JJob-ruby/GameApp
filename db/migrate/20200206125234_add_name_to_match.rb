class AddNameToMatch < ActiveRecord::Migration[6.0]
  def change
   
    add_column :matches, :name, :string, null: false

  end
end
