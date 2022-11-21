class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :telephone_number, presence: true
  validates :is_deleted, inclusion: [true, false]

  has_many :bookmarks, dependent: :destroy
  has_many :plan_orders, dependent: :destroy


  def full_address
    ['〒', postal_code, '　', prefecture_name, address_city, address_street, address_building].join('')
  end

  enum house_type: { single_family_home: 0, two_family_home: 1, multi_family_home: 2 }
  enum kitchen_type: { wall: 0, peninsula: 1, island: 2 , others: 3}, _prefix: true
  enum bathroom_area: { one_tsubo: 0, one_quarter_tsubo: 1, others: 2 }, _prefix: true
  enum japanese_room: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum storage: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum den: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum den_type: { open_type: 0, closed_type: 1, others: 2 }, _prefix: true
  enum wic: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum family_closet: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum sic: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum pantry: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum loft: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum void: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum laundry_room: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum garden: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true

end
