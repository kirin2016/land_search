class CreatePlanOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_orders do |t|
      t.integer :customer_id, null: false
      t.integer :land_percel_id, null: false
      t.text :remarks
      t.datetime :contact_datetime_1, null: false
      t.datetime :contact_datetime_2, null: false
      t.datetime :contact_datetime_3, null: false
      t.integer :order_status, null: false, default: 0, limit: 1
      t.integer :tenant_number_order
      t.string :tenant_member_order
      t.integer :house_type_order, limit: 1
      t.integer :total_budget_order
      t.integer :number_floor_order
      t.integer :floor_area_order
      t.integer :number_room_order
      t.integer :ldk_floor_number_order
      t.integer :ldk_area_order
      t.integer :kitchen_type_order, limit: 1
      t.integer :mbr_area_order
      t.integer :br_area_order
      t.integer :bathroom_area_order, limit: 1
      t.integer :japanese_room_order, limit: 1
      t.integer :storage_order, limit: 1
      t.integer :den_order, limit: 1
      t.integer :den_type_order, limit: 1
      t.integer :wic_order, limit: 1
      t.integer :family_closet_order, limit: 1
      t.integer :sic_order, limit: 1
      t.integer :pantry_order, limit: 1
      t.integer :loft_order, limit: 1
      t.integer :void_order, limit: 1
      t.integer :laundry_room_order, limit: 1
      t.integer :garden_order, limit: 1
      t.integer :parking_number_order
      t.string :car_model_order
      t.integer :bicycle_parking_number_order
      t.text :request_details_order

      t.timestamps null: false
    end
  end
end
