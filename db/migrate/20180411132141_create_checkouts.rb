class CreateCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :checkouts do |t|
      t.string :address
      t.integer :pincode
      t.integer :user_id
      t.integer :phone

      t.timestamps
    end
  end
end
