class User < ApplicationRecord
  has_secure_password
  #coins:
    has_many :user_coins
    has_many :coins, through: :user_coins

    has_many :coins_user_comments
    has_many :coins, through: :coins_user_comments

#exchanges:

  has_many :user_exchanges
  has_many :exchanges, through: :user_exchanges

  has_many :exchange_user_comments
  has_many :exchanges, through: :exchange_user_comments



  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

end
