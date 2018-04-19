class AddAttachmentArticleimg1ToArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :articleimg1
    end
  end

  def self.down
    remove_attachment :articles, :articleimg1
  end
end
