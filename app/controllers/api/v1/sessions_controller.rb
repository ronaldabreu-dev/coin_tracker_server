class Api::V1::SessionsController < ApplicationController
  skip_before_action :auth_user, only: [:new, :create]

  def destroy
    user = User.find_by(user_name: params[:session][:name])
    session.delete(:user_id)

    render json: "You have logged out"
  end

  def create
    user = User.find_by(name: params[:session][:name])

    if user && user.authenticate(params[:session][:password])
    render json: user.coins
    else
    full_message = ["wrong password or username"]
    render json: full_message
    end

  end

end
