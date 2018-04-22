class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
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
