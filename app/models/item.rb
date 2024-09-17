class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one :order
  has_one_attached :image
end
