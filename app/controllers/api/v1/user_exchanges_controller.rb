class Api::V1::UserExchangesController < ApplicationController

  def create
    @current_user = User.find_by(user_name: params[:exchangeObj][:"\"user_name\""])

    if @current_user.exchanges.map{|s| s.symbol}.include?(params[:exchangeObj][:"\"symbol\""])
    render json: {"message": "Already tracking!"}
    else
      @exchange = Exchange.create(symbol: params[:exchangeObj][:"\"symbol\""])
      @current_user.exchanges.push(@exchange)
      render json: @current_user.exchanges
    end

  end

  def show
  @current_user = User.find_by(user_name: params[:id])
  render json: @current_user.exchanges
  end

  private

  def user_exchanges_params
   params.require(:exchangeObj).permit!
  end


end
