class UserCoin < ApplicationRecord
    belongs_to :coin
    belongs_to :user

  validates :coin_id, uniqueness: true
end
