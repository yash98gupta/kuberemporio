class AddStatusToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :Status, :string
  end
end
