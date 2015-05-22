class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable


  def karma
    all_votes = Vote.where(voteable_id: id, voteable_type: "Answer")
    all_votes.sum(:score)
  end
end
