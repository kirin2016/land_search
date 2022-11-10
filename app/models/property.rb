class Property < ApplicationRecord

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_town, presence: true
  validates :address_street, presence: true
  validates :telephone_number, presence: true
  validates :nearest_station, presence: true
  validates :transportation, presence: true
  validates :building_coverage_ratio, presence: true
  validates :floor_area_ratio, presence: true

  has_many :land_percels, dependent: :destroy
  has_many :images, dependent: :destroy



  def full_address_publics
    ['〒', postal_code, '　', prefecture_name, address_city, address_town].join('')
  end

  def full_address_admins
    ['〒', postal_code, '　', prefecture_name, address_city, address_town, address_street].join('')
  end

  enum transportation: { walking: 0, bus: 1, car: 2 }

end
