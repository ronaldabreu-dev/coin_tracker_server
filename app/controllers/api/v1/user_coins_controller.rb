class Api::V1::UserCoinsController < ApplicationController

  def create

    @current_user = User.find_by(user_name: params[:coinObj][:"\"user_name\""])

    if @current_user.coins.map{|s| s.symbol}.include?(params[:coinObj][:"\"symbol\""])
    render json: {"message": "Already tracking!"}
    else
      @coin = Coin.create(symbol: params[:coinObj][:"\"symbol\""])
      @current_user.coins.push(@coin)
      render json: @current_user.coins
    end

  end

  def show

  @current_user = User.find_by(user_name: params[:id])
  render json: @current_user.coins

  end

  private

  def user_coins_params
   params.require(:coinObj).permit!
  end


end
