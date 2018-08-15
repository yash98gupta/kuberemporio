class AddFavouriteToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :favourite, :boolean, :default => false
  end
end
