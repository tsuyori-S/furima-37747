class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :province
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_time

  validates :image,       presence: true
  validates :name,        presence: true
  validates :information, presence: true
  validates :price,       presence: true,
                          numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :province_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
end
