class Vote < ActiveRecord::Base
  attr_accessible :upvote, :votable_id, :votable_type, :user_id

  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :upvote, presence: true
end
