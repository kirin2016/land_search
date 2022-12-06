class Image < ApplicationRecord

  validates :image, presence: true

  belongs_to :property
  mount_uploaders :image, ImageUploader

end
