class Relationship < ActiveRecord::Base
    # class_name is created bc follower doesn't have
    #  a model
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true


end
