class Api::V1::UsersController < ApplicationController
  skip_before_action :auth_user, only: [:new, :create]
  before_action :find_user, only: [:edit, :update, :destroy]

  def create
     puts params
    new_user_params = {}
    new_user_params["user_name"] = params["username"]
    new_user_params["password"] = params["password"]

    user = User.new(new_user_params)

    if user.save
      response = []
      response.push(user)
      user.coins = []
      response.push(user.coins)
     render json: response
    else
     render json: user.errors.full_messages
    end

  end

  def show

    if @user
     render json: @user
    else
     render json: "user not found"
    end

  end

  private

  def user_params
   params.require(:user).permit!
  end

  def find_user
   @user = User.find_by(user_name:params[:id])
  end

end
