class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  include ImageUploader::Attachment(:image)
  
  has_many :posts, dependent: :destroy

  has_one_attached :avatar

  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
 
end
