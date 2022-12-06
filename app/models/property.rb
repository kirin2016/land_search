class Property < ApplicationRecord

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_town, presence: true
  validates :address_street, presence: true
  validates :nearest_railroad, presence: true
  validates :nearest_station, presence: true
  validates :transportation, presence: true
  validates :building_coverage_ratio, presence: true
  validates :floor_area_ratio, presence: true
  validates :land_use, inclusion: [true, false]
  validates :real_estate_name, presence: true
  validates :real_estate_telephone, presence: true

  # validates :land_percels, presence: true
  # validates :images, presence: true

  has_many :land_percels, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true



  def full_address_publics
    ['〒', postal_code, '　', prefecture_name, address_city, address_town].join('')
  end

  def full_address_admins
    ['〒', postal_code, '　', prefecture_name, address_city, address_town, address_street].join('')
  end

  enum transportation: { walking: 0, bus: 1, car: 2 }

  scope :search, -> (search_params) do
    return if search_params.blank?

    prefecture_code_is(search_params[:prefecture_code])
      .address_city_like(search_params[:address_city])
      .address_town_like(search_params[:address_town])
      .nearest_railroad_like(search_params[:nearest_railroad])
      .nearest_station_like(search_params[:nearest_station])
      .transportation_is(search_params[:transportation])
      .walking_time_to(search_params[:walking_time_to])
      .bus_time_to(search_params[:bus_time_to])
      .bus_stop_walking_time_to(search_params[:bus_stop_walking_time_to])
      .car_time_to(search_params[:car_time_to])
      .land_use_is(search_params[:land_use])
      .area_from(search_params[:area_from])
      .area_to(search_params[:area_to])
  end
  scope :prefecture_code_is, -> (prefecture_code) { where(prefecture_code: prefecture_code) if prefecture_code.present? }
  scope :address_city_like, -> (address_city) { where('address_city LIKE ?', "%#{address_city}%") if address_city.present? }
  scope :address_town_like, -> (address_town) { where('address_town LIKE ?', "%#{address_town}%") if address_town.present? }
  scope :nearest_railroad_like, -> (nearest_railroad) { where('nearest_railroad LIKE ?', "%#{nearest_railroad}%") if nearest_railroad.present? }
  scope :nearest_station_like, -> (nearest_station) { where('nearest_station LIKE ?', "%#{nearest_station}%") if nearest_station.present? }
  scope :transportation_is, -> (transportation) { where(transportation: transportation) if transportation.present? }
  scope :walking_time_to, -> (to) { where('walking_time <= ?', to) if to.present? }
  scope :bus_time_to, -> (to) { where('bus_time <= ?', to) if to.present? }
  scope :bus_stop_walking_time_to, -> (to) { where('bus_stop_walking_time <= ?', to) if to.present? }
  scope :car_time_to, -> (to) { where('car_time <= ?', to) if to.present? }
  scope :land_use_is, -> (land_use) { where(land_use: land_use) if land_use.present? }
  scope :area_from, -> (from) { where('? <= area', from) if from.present? }
  scope :area_to, -> (to) { where('area <= ?', to) if to.present? }

end
