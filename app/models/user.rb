class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_one :profile
  has_secure_password # Makes sure password is there and valid.
  has_many :posts, dependent: :destroy
  has_many :followed_users, through: :relationships, 
                              source: :followed

  before_save { email.downcase! }
  before_create :create_remember_token

  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }

  # scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }


  # validates :username, presence: true
  # validates :summary, presence: true, length: { maximum: 1000 }
  # validates :injury_year, presence: true


  # Search single words and phrases.
  def self.search(search)
    require'will_paginate/array'
    where("name like ?", "%#{search}%")
  end

  def feed
    Post.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
