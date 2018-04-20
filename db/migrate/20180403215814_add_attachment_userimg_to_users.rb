class AddAttachmentUserimgToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :userimg
    end
  end

  def self.down
    remove_attachment :users, :userimg
  end
end
