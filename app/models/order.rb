class Order < ApplicationRecord
  belongs_to :user
  has_many :checkouts
end
