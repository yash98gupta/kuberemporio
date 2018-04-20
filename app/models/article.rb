class Article < ApplicationRecord

  has_attached_file :articleimg, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :articleimg, content_type: /\Aimage\/.*\z/

  has_attached_file :articleimg1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :articleimg1, content_type: /\Aimage\/.*\z/

  has_attached_file :articleimg2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :articleimg2, content_type: /\Aimage\/.*\z/

  has_attached_file :articleimg3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :articleimg3, content_type: /\Aimage\/.*\z/

  has_attached_file :articleimg4, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :articleimg4, content_type: /\Aimage\/.*\z/

  has_many :userratings

end
