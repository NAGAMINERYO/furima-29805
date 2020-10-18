class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :email, confirmation: true
  validates :password, length: { minimum: 6 }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力' }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])/,
                                 message: 'は英大文字・小文字・数字それぞれ１文字以上含む必要があります' }
end
