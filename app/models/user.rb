class User < ApplicationRecord
  has_secure_password
  #coins:
    has_many :user_coins
    has_many :coins, through: :user_coins

    has_many :coin_user_comments
    
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

end
