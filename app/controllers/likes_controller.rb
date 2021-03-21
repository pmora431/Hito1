class LikesController < ApplicationController
    before_action :set_like, only: %i[ destroy ]

    def create
        @tweet = Tweet.find(params[:tweet_id])
        respond_to do |format| 
            if @tweet.likes.where(user_id: current_user.id).count === 0 
            @like = Like.create(tweet_id: @tweet.id, user_id: current_user.id)
            format.html { redirect_to tweets_path, notice: "Tweet was successfully created." }
            format.json { render :index, status: :created, location: @tweet }
            elsif @tweet.likes.where(user_id: current_user.id).count > 0
            @tweet.likes.where(user_id: current_user.id).each do |like|
                like.destroy
                format.html { redirect_to tweets_path, notice: "Tweet was successfully deleted." }
                format.json { render :index, status: :created, location: @tweet }
            end
            end
        end
    end

    def destroy
    @tweet = Tweet.find(params[:tweet_id]) 
        @like.destroy
    end

    private
    def set_like
    @like = Like.find(params[:id])
    end
end
  
