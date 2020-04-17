class TweetsController < ApplicationController
  # before_action :set_group

  def index
    @tweets = Tweet.all
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path(@group), notice: 'メッセージが送信されました'
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :image, :group_id).merge(user_id: current_user.id)
  end

end
