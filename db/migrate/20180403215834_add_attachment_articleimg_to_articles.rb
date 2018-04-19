class AddAttachmentArticleimgToArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :articleimg
    end
  end

  def self.down
    remove_attachment :articles, :articleimg
  end
end
