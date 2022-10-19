class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all #これは単数
  end
  
  def new
    @tweets=Tweet.new
  end
  
  def create
    @tweets=Tweet.new(message: params[:tweet][:message], tdate: Time.current, uid: session[:userid])
    if @tweets.save
      flash[:notice] = "Tweet success!"
      redirect_to root_path
    else
      render "new"
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path

  end
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets=Tweet.find(params[:id])
    if @tweets.update(message: params[:tweet][:message])
      flash[:notice] = "Update success!"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def like
    twt=Tweet.find(params[:id])
    unless twt.islike(current_user)
      current_user.like_tweets << twt
    end
    redirect_to root_path
  end
  
  def unlike
    twt= Tweet.find(params[:id])
    if twt.islike(current_user)
      twt.likes.find_by(user_id: current_user.id).destroy
    end
    redirect_to root_path
  end

end
