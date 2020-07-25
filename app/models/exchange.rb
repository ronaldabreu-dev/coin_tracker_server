class Exchange < ApplicationRecord
  has_many :user_exchanges
  has_many :users, through: :user_exchanges

  has_many :user_exchange_comments
  has_many :users, through: :user_exchange_comments
end
