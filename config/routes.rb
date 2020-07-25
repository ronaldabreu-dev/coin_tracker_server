Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :coin_user_comments, :exchange_user_comments, :user_coins, :user_exchanges, :coins, :exchanges, :users, :sessions
    end
  end
end
