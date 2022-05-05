class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :province_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が不適です。ハイフン（ー）を入れてください" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/, message: "を正しく入力してください" }
    validates :token
  end
  validates :province_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, province_id: province_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end