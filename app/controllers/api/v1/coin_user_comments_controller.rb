class Api::V1::CommentsController < ApplicationController
  class Api::V1::CoinUserCommentsController < ApplicationController

    def index
      byebug
        puts params
        comments = CoinUserComment.all
        render json:comments
    end

    def create

      @current_user = User.find_by(user_name: params[:username])
        symbols = Coin.all.map { |e| e.symbol }

         if symbols.include?(params[:symbol])
        @coin = Coin.find_by(symbol: params[:symbol])
         else
        @coin = Coin.create(symbol: params[:symbol])
         end

        @comment = CoinUserComment.create(
          coin_id: @coin.id,
          user_id: @current_user.id,
          comment: params[:comment]
        )

        @current_user.coin_user_comments.push(@comment)
        @coin.coin_user_comments.push(@comment)
        render json: @coin.coin_user_comments
    end


def show
    symbols = Coin.all.map { |e| e.symbol }
    response = []

   if symbols.include?(params[:id])

    @coin = Coin.find_by(symbol: params[:id])
    response.push(@coin.coin_user_comments)
  else
    @coin = "coin not found"
    response.push(@coin)
   end

    render json: response

end

    private

    def coin_user_comments_params
     params.require(:coin_user_comments).permit!
    end


  end
end
