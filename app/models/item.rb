class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :day
  # has_one :buy
  has_one_attached :image

  validates :user, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :cost_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true

end
