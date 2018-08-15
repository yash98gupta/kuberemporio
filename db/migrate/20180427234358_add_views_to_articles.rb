class AddViewsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :views, :integer ,:default => 0
  end
end
