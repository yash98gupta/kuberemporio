class AddCheckoutToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :checkout_id, :integer
  end
end
