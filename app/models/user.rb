class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas
  has_many :likes
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true

end
