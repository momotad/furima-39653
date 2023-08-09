class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/

  with_options presence: true do
    validates :last_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
    validates :last_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'Input full-width katakana characters.' }
  end

  validates :birthday, presence: true
end
