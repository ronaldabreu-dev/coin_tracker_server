class Exchange < ApplicationRecord
  has_many :user_exchanges
  has_many :users, through: :user_exchanges

  has_many :exchange_user_comments
  has_many :users, through: :exchange_user_comments
end
