class Post < ActiveRecord::Base
  belongs_to :user
  has_one :image
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 2, maximum: 2000 }
  include Bootsy::Container
  # validates :image, presence: true

  # CARRIERWAVE #
  mount_uploader :image, ImageUploader
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

  # Returns posts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end


end
