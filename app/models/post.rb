class Post < ActiveRecord::Base
  attr_accessible :body, :link, :user_id

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  belongs_to :user
end
