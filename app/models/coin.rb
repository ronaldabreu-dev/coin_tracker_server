class Coin < ApplicationRecord
  has_many :user_coins
  has_many :users, through: :user_coins

  has_many :user_coin_comments
  has_many :users, through: :user_coin_comments
end
