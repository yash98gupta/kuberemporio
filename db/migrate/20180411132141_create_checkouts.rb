class CreateCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :checkouts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone
      t.string :country
      t.string :state
      t.string :city
      t.integer :pincode
      t.string :house_no
      t.string :street_name
      t.string :landmark

      t.timestamps
    end
  end
end
