class BuyDelivery
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :address, :building, :telephone, :user_id, :item_id, :buy_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A^[0-9]{3}-[0-9]{4}$+\z/, message: 'Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A^0[789]0[\d]{7,8}$+\z/, message: 'Input only number' }
    validates :user_id
    validates :item_id
    validates :token
  end
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id.id)
    Delivery.create(postcode: postcode, area_id: area_id, city: city, address: address, building: building, telephone: telephone, buy_id: buy.id)
  end

end