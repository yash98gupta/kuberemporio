class AddUserratingToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :usr_rating, :integer
  end
end
