class CreateShoppingcarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppingcarts do |t|
      t.string :itemname
      t.integer :quantity

      t.timestamps
    end
  end
end
