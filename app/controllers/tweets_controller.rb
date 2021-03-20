class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy retweet ]
  before_action :initialize_todo, only: [:index]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all.page(params[:page])
    if params[:content] and params[:content] != 'all'
      @tweets = @tweets.where(content: params[:content])
    end
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params.merge(user: current_user))

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path, notice: "Tweet was successfully created." }
        format.json { render :index, status: :created, location: @tweet }
      else
        @tweets = Tweet.order(sort_column + " " + sort_direction).page(params[:page])
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def retweet
    original_tweet = Tweet.find(params[:id])

    @retweet = Tweet.new(
      user_id: current_user.id,
      content: original_tweet.content,
      retweet_id: original_tweet.id
    )

    respond_to do |format|
      if @retweet.save
        format.html { redirect_to tweets_path, notice: "Retweet was successfully created." }
        format.json { render :index, status: :created, location: @retweet }
      else
        @retweet = Tweet.order(sort_column + " " + sort_direction).page(params[:page])
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @retweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id, :retweet_id, :retweet)
    end

    def initialize_todo
      @tweet = Tweet.new
    end

    def retweet_params
      params.require(:retweet).permit(:retweet_id, :content).merge(user_id: current_user.id)
    end
end
