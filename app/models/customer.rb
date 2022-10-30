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

  has_many :bookmarks, dependent: :destroy
  has_many :plan_orders, dependent: :destroy


  def full_address
    ['〒', postal_code, '　', prefecture_name, address_city, address_street, address_building].join('')
  end

  enum house_type: { single_family_home: 0, two_family_home: 1, multi_family_home: 2 }
  enum kitchen_type: { wall: 0, peninsula: 1, island: 2 }
  enum bathroom_area: { one_tsubo: 0, one_quarter_tsubo: 1, others: 2 }
  enum japanese_room: { need: 0, if_have_room: 1, needless: 2 }
  enum storage: { need: 0, if_have_room: 1, needless: 2 }
  enum den: { need: 0, if_have_room: 1, needless: 2 }
  enum den_type: { open_type: 0, closed_type: 1, others: 2 }
  enum wic: { need: 0, if_have_room: 1, needless: 2 }
  enum family_closet: { need: 0, if_have_room: 1, needless: 2 }
  enum sic: { need: 0, if_have_room: 1, needless: 2 }
  enum pantry: { need: 0, if_have_room: 1, needless: 2 }
  enum loft: { need: 0, if_have_room: 1, needless: 2 }
  enum void: { need: 0, if_have_room: 1, needless: 2 }
  enum laundry_room: { need: 0, if_have_room: 1, needless: 2 }
  enum garden: { need: 0, if_have_room: 1, needless: 2 }

end