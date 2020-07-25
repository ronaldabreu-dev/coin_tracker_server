class Api::V1::CoinsController < ApplicationController
  def index
    top_ten = @@client.stock_market_list(:mostactive)
    render json: top_ten
  end

  def show
    logo = @@client.logo("#{params[:id]}")
    render json: logo.url
  end

end
