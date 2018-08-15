class AddUseridToCheckout < ActiveRecord::Migration[5.1]
  def change
    add_column :checkouts, :user_id, :integer
  end
end
