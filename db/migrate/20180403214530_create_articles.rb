class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :description
      t.integer :price
      t.float :weight
      t.float :height
      t.string :colour
      t.text :review
      t.string :company
      t.float :discount
      t.string :material
      t.integer :ratings

      t.timestamps
    end
  end
end
