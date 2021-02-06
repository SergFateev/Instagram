class Post < ApplicationRecord
  
  belongs_to :user
  
  has_many :comments
  
  has_many :likes, dependent: :destroy
  
  include ImageUploader::Attachment(:image)
#  validate :image_presence

  # def image_presence
  #   errors.add(:image, "can't be blank") unless image.attached?
  # end
end
