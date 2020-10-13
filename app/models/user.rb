class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :birthday, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :email, confirmation: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力" }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力" }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,message: "ユーザー本名のフリガナは全角（カタカナ）で入力させること" }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,message: "ユーザー本名のフリガナは全角（カタカナ）で入力させること" }
  validates :password, presence: true,
             format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])/,
             message: "は英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
end
