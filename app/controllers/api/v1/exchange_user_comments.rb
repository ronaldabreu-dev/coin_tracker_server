class Api::V1::CommentsController < ApplicationController
  class Api::V1::ExchangeUserCommentsController < ApplicationController

    def create

      @current_user = User.find_by(user_name: params[:exchangeObj][:"\"user_name\""])

        @comment = ExchangeUserComment.create(
          exchange_id: params[:exchangeObj][:"\"id\""],
          user_id: @current_user.id
        )
        @current_user.exchange_user_comments.push(@comment)
        render json: @current_user.exchange_user_comments
      end

    end

    def show

    @current_user = User.find_by(name: params[:id])
    render json: @current_user.exchange_user_comments

    end

    private

    def exchange_user_comments_params
     params.require(:commentObj).permit!
    end


  end
end
