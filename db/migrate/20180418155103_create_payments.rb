class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :payment_id
      t.string :amount
      t.string :method
      t.string :bank
      t.string :email
      t.string :contact_no
      t.string :fee
      t.string :tax

      t.timestamps
    end
  end
end
