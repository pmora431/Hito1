class Tweet < ApplicationRecord
  belongs_to :user
  paginates_per 50
  #https://stackoverflow.com/questions/63523781/how-to-implement-retweet-functionality-in-ror
  belongs_to :user
  has_many :retweets, class_name: 'Tweet', foreign_key: 'retweet_id'
  validates :content,presence: true
end
