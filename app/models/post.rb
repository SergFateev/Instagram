class Post < ApplicationRecord
  belongs_to :user
  include ImageUploader::Attachment(:image)
#  validate :image_presence

  # def image_presence
  #   errors.add(:image, "can't be blank") unless image.attached?
  # end
end
