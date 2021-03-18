class Tweet < ApplicationRecord
  belongs_to :user
  validates :content,presence: true
  paginates_per 50
end
