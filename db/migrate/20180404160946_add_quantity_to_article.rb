class AddQuantityToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :quantity, :integer
  end
end
