class Api::V1::CommentsController < ApplicationController
  class Api::V1::CoinUserCommentsController < ApplicationController

    def index
        comments = CoinUserComment.all
        render json:comments
    end

    def create
      @current_user = User.find_by(user_name: params[:coinObj][:"\"user_name\""])

        @comment = CoinUserComment.create(
          coin_id: params[:coinObj][:"\"id\""],
          user_id: @current_user.id
        )
        @current_user.coin_user_comments.push(@comment)
        render json: @current_user.coin_user_comments
      end

    end

    def show

    @current_user = User.find_by(user_name: params[:id])
    render json: @current_user.coin_user_comments

    end

    private

    def coin_user_comments_params
     params.require(:commentObj).permit!
    end


  end
end
