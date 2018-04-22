class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :userimg, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :userimg, content_type: /\Aimage\/.*\z/

  has_many :articles
  has_many :shoppingcarts
<<<<<<< HEAD
  has_many :orders
=======

>>>>>>> 92422452049f5a93766e7474d468187e4397ccb8
end
