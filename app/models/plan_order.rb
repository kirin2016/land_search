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
  enum bathroom_area_order: { one_tsubo: 0, one_quarter_tsubo: 1, others: 2 }, _prefix: true
  enum japanese_room_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum storage_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum den_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum den_type_order: { open_type: 0, closed_type: 1, others: 2 }, _prefix: true
  enum wic_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum family_closet_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum sic_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum pantry_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum loft_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum void_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum laundry_room_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true
  enum garden_order: { want: 0, if_have_room: 1, needless: 2 }, _prefix: true

end
