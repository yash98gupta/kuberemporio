class AddAttachmentArticleimg2ToArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :articleimg2
    end
  end

  def self.down
    remove_attachment :articles, :articleimg2
  end
end
