class LandPercel < ApplicationRecord

  validates :property_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :area, presence: true
  validates :price_tsubo, presence: true
  validates :shape, presence: true
  validates :connecting_road_situation, presence: true
  validates :main_road_width, presence: true
  validates :main_road_direction, presence: true
  validates :frontage, presence: true
  validates :difference_elevation, presence: true
  validates :private_road_burden, presence: true
  validates :sale_status, presence: true

  belongs_to :property
  has_many :bookmarks, dependent: :destroy
  has_many :plan_orders, dependent: :destroy


  attachment :image

  enum shape: { regular: 0, flag_pole: 1, irregular: 2, long_narrow: 3 }
  enum connecting_road_situation: { one_frontage: 0, corner_lot: 1, two_frontages: 2, three_four_frontages: 3 }
  enum main_road_direction: { north: 0, south: 1, east: 2, west: 3 }
  enum sale_status: { on_sale: 0, sales_pending: 1, contracted: 2 }

end
