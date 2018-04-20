class AddAdditionaldetailsToShoppingcart < ActiveRecord::Migration[5.1]
  def change
    add_column :shoppingcarts, :item_price, :integer
    add_column :shoppingcarts, :item_id, :integer
  end
end
