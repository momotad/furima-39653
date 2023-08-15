class Delivery < ApplicationRecord
  belongs_to :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  # 以下バリデーションはFromオブジェクトのBuyDeliveryに転記済み
  # validates :postcode, presence: true, format: { with: ^[0-9]{3}-[0-9]{4}$, message: 'Enter it as follows (e.g. 123-4567)' }
  # validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :city, presence: true
  # validates :address, presence: true
  # validates :telephone, presence: true, format: { with: ^0[789]0[\d]{7,8}$, message: 'Input only number' }

end
