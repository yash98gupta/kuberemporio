class AddUserToShoppingcart < ActiveRecord::Migration[5.1]
  def change
    add_column :shoppingcarts, :user_id, :integer
  end
end
