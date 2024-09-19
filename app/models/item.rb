class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one :order
  has_one_attached :image

  validates :image, :name, :description, :price, presence: { message: "can't be blank" }

  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 0, message: "can't be blank" }

  validates :price, presence: { message: "can't be blank" },
                    numericality: { only_integer: true, message: 'is not a number' },
                    numericality: { greater_than_or_equal_to: 300, message: 'must be greater than or equal to 300' },
                    numericality: { less_than_or_equal_to: 9_999_999, message: 'must be less than or equal to 9999999' }
end
