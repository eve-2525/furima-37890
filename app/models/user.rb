class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  has_many:items

  with_options presence: true,
               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true,
               format: { with: /\A[ァ-ヶー－]+\z/,
                         message: 'kana is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  encrypted_password = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: encrypted_password, message: 'is invalid. Include both letters and numbers'
end
