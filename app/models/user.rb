class User < ActiveRecord::Base
  has_secure_password # Makes sure password is there and valid.
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false }


  validates :password, length: { minimum: 6 }

end
