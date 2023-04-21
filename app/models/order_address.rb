class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :price, :user_id, :item_id, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が無効です。ハイフンを入れてください"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end