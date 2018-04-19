class AddAttachmentAvatarToShoppingcarts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :shoppingcarts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :shoppingcarts, :avatar
  end
end
