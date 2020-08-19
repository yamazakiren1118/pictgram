class Comment < ApplicationRecord
  validates :comment, presence:true
  belongs_to :user, optional:true
  belongs_to :topic, optional:true
end
