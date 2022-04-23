class Item < ApplicationRecord
  belongs_to :user
  has_one :buying_history
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

end
