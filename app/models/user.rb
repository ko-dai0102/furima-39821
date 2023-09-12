class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :last_name, presence: true, format: { with: VALID_LAST_NAME_REGEX }

  VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name, presence: true, format: { with: VALID_FIRST_NAME_REGEX }

  VALID_LAST_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :last_name_kana, presence: true, format: { with: VALID_LAST_NAME_KANA_REGEX }

  VALID_FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_FIRST_NAME_KANA_REGEX }

  validates :birthdate, presence: true
end
