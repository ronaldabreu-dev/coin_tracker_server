class Coin < ApplicationRecord
  has_many :user_coins
  has_many :users, through: :user_coins

  has_many :coin_user_comments
  has_many :users, through: :coin_user_comments
end
