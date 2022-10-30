class Bookmark < ApplicationRecord

  validates :customer_id, presence: true
  validates :land_percel_id, presence: true

  belongs_to :customer
  belongs_to :land_percel

end
