class OrderShip
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :phone_number, :address, :building_name, :item_id, :user_id, :token

  VALID_POSTAL_CODE_REGEX = /\A\d{3}-\d{4}\z/
  validates :post_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }

  with_options presence: true do
    validates :user_id
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :item_id
    validates :token
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Ship.create(post_code: post_code, address: address, prefecture_id: prefecture_id, city: city, phone_number: phone_number,
                building_name: building_name, order_id: order.id)
  end
end
