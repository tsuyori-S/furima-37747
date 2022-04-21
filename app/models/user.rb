class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）で入力してください'}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）で入力してください'}
  validates :ruby_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message:'全角カタカナで入力してください'}
  validates :ruby_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message:'全角カタカナで入力してください'}
  validates :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数字混合で入力してください'}
  validates :password, confirmation: true

end
