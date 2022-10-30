class PlanOrder < ApplicationRecord

  validates :customer_id, presence: true
  validates :land_percel_id, presence: true
  validates :contact_datetime_1, presence: true
  validates :contact_datetime_2, presence: true
  validates :contact_datetime_3, presence: true
  validates :order_status, presence: true

  belongs_to :customer
  belongs_to :land_percel


  enum order_status: { confirming: 0, planning: 1, completion: 2 }
  enum house_type_order: { single_family_home: 0, two_family_home: 1, multi_family_home: 2 }
  enum kitchen_type_order: { wall: 0, peninsula: 1, island: 2 }
  enum bathroom_area_order: { one_tsubo: 0, one_quarter_tsubo: 1, others: 2 }
  enum japanese_room_order: { need: 0, if_have_room: 1, needless: 2 }
  enum storage_order: { need: 0, if_have_room: 1, needless: 2 }
  enum den_order: { need: 0, if_have_room: 1, needless: 2 }
  enum den_type_order: { open_type: 0, closed_type: 1, others: 2 }
  enum wic_order: { need: 0, if_have_room: 1, needless: 2 }
  enum family_closet_order: { need: 0, if_have_room: 1, needless: 2 }
  enum sic_order: { need: 0, if_have_room: 1, needless: 2 }
  enum pantry_order: { need: 0, if_have_room: 1, needless: 2 }
  enum loft_order: { need: 0, if_have_room: 1, needless: 2 }
  enum void_order: { need: 0, if_have_room: 1, needless: 2 }
  enum laundry_room_order: { need: 0, if_have_room: 1, needless: 2 }
  enum garden_order: { need: 0, if_have_room: 1, needless: 2 }

end
