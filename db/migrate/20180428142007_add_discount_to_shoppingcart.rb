class AddDiscountToShoppingcart < ActiveRecord::Migration[5.1]
  def change
    add_column :shoppingcarts, :discount, :integer
  end
end
