class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  include ImageUploader::Attachment(:image)
  
  has_many :posts, dependent: :destroy

  has_one_attached :avatar

  has_many :comments

  has_many :follower_follows, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :following_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :following_follows, source: :following

  has_many :likes, dependent: :destroy
   
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

end
