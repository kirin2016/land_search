class LandPercel < ApplicationRecord

  validates :property_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :property_id }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :area, presence: true, numericality: { greater_than: 0 }
  validates :price_tsubo, presence: true, allow_blank: true
  validates :shape, presence: true
  validates :connecting_road_situation, presence: true
  validates :main_road_width, presence: true, numericality: {greater_than: 0}
  validates :main_road_direction, presence: true
  validates :frontage, presence: true, numericality: {greater_than: 0}
  validates :difference_elevation, inclusion: [true, false]
  validates :private_road_burden, inclusion: [true, false]
  validates :sale_status, presence: true

  belongs_to :property
  has_many :bookmarks, dependent: :destroy
  has_many :plan_orders, dependent: :destroy

  mount_uploader :reference_plan_id, ImageUploader


  enum shape: { regular: 0, flag_pole: 1, irregular: 2, long_narrow: 3 }
  enum connecting_road_situation: { one_frontage: 0, corner_lot: 1, two_frontages: 2, three_four_frontages: 3 }
  enum main_road_direction: { north: 0, south: 1, east: 2, west: 3 }
  enum sale_status: { on_sale: 0, sales_pending: 1, contracted: 2 }

end
