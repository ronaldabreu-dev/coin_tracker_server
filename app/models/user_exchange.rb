class UserExchange < ApplicationRecord
    belongs_to :exchange
    belongs_to :user

  validates :exchange_id, uniqueness: true
end
