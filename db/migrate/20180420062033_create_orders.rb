class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :itemname
      t.integer :quantity
      t.integer :user_id
      t.integer :item_price
      t.integer :item_id

      t.timestamps
    end
  end
end
