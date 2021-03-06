class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :description, presence: true
  
  belongs_to :user
  belongs_to :topic
end
