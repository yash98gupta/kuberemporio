class AddAttachmentArticleimg4ToArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :articles do |t|
      t.attachment :articleimg4
    end
  end

  def self.down
    remove_attachment :articles, :articleimg4
  end
end
