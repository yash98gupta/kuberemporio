class CreateUserratings < ActiveRecord::Migration[5.1]
  def change
    create_table :userratings do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :user_rating

      t.timestamps
    end
  end
end
