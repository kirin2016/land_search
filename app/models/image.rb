class Image < ApplicationRecord

  validates :property_id, presence: true
  validates :image, presence: true

  belongs_to :property
  mount_uploader :image, ImageUploader

end
