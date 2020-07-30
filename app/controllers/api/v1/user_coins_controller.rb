class Api::V1::UserCoinsController < ApplicationController

  def create
    puts params
    @current_user = User.find_by(user_name: params['user_name'])

    if @current_user.coins.map{|s| s.symbol}.include?(params['symbol'])
    render json: {"message": "Already tracking!"}
    else
      Coin.find_by(symbol: params['symbol']) ? @coin = Coin.find_by(symbol: params['symbol']) : @coin = Coin.create(symbol: params['symbol'])

      @current_user.coins.push(@coin)
      response = []
      response.push(@current_user)
      response.push(@current_user.coins)
    render json: response
    end
  end

  def show

  @current_user = User.find_by(user_name: params[:id])
  render json: @current_user.coins

  end


    def destroy

      puts params
      @current_user = User.find_by(user_name: params['user_name'])

      if @current_user.coins.map{|s| s.symbol}.include?(params['symbol'])
        @coin = Coin.find_by(symbol: params['symbol'])

        @current_user.coins.delete(@coin)

        response = []
        response.push(@current_user)
        response.push(@current_user.coins)

        render json: response
      else
      response = ["not currently tracking!"]
      render json: response
      end

    end

  private

  def user_coins_params
   params.require(:coinObj).permit!
  end


end
