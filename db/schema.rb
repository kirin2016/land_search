# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_13_194059) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "land_percel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.integer "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.string "telephone_number", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "sale_staff"
    t.string "sale_staff_telephone"
    t.integer "tenant_number"
    t.string "tenant_member"
    t.integer "house_type", limit: 1
    t.integer "total_budget"
    t.integer "number_floor"
    t.integer "floor_area"
    t.integer "number_room"
    t.integer "ldk_floor_number"
    t.integer "ldk_area"
    t.integer "kitchen_type", limit: 1
    t.integer "mbr_area"
    t.integer "br_area"
    t.integer "bathroom_area", limit: 1
    t.integer "japanese_room", limit: 1
    t.integer "storage", limit: 1
    t.integer "den", limit: 1
    t.integer "den_type", limit: 1
    t.integer "wic", limit: 1
    t.integer "family_closet", limit: 1
    t.integer "sic", limit: 1
    t.integer "pantry", limit: 1
    t.integer "loft", limit: 1
    t.integer "void", limit: 1
    t.integer "laundry_room", limit: 1
    t.integer "garden", limit: 1
    t.integer "parking_number"
    t.string "car_model"
    t.integer "bicycle_parking_number"
    t.text "request_details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.integer "property_id", null: false
    t.string "image", null: false
    t.string "explanation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "land_percels", force: :cascade do |t|
    t.integer "property_id", null: false
    t.string "name", null: false
    t.integer "price", null: false
    t.float "area", null: false
    t.integer "price_tsubo", null: false
    t.integer "shape", limit: 1, default: 0, null: false
    t.integer "connecting_road_situation", limit: 1, default: 0, null: false
    t.float "main_road_width", null: false
    t.integer "main_road_direction", limit: 1, default: 0, null: false
    t.float "frontage", null: false
    t.boolean "difference_elevation", default: false, null: false
    t.boolean "private_road_burden", default: false, null: false
    t.integer "sale_status", limit: 1, default: 0, null: false
    t.string "reference_plan_id"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plan_orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "land_percel_id", null: false
    t.text "remarks"
    t.datetime "contact_datetime_1", null: false
    t.datetime "contact_datetime_2", null: false
    t.datetime "contact_datetime_3", null: false
    t.integer "order_status", limit: 1, default: 0, null: false
    t.integer "tenant_number_order"
    t.string "tenant_member_order"
    t.integer "house_type_order", limit: 1
    t.integer "total_budget_order"
    t.integer "number_floor_order"
    t.integer "floor_area_order"
    t.integer "number_room_order"
    t.integer "ldk_floor_number_order"
    t.integer "ldk_area_order"
    t.integer "kitchen_type_order", limit: 1
    t.integer "mbr_area_order"
    t.integer "br_area_order"
    t.integer "bathroom_area_order", limit: 1
    t.integer "japanese_room_order", limit: 1
    t.integer "storage_order", limit: 1
    t.integer "den_order", limit: 1
    t.integer "den_type_order", limit: 1
    t.integer "wic_order", limit: 1
    t.integer "family_closet_order", limit: 1
    t.integer "sic_order", limit: 1
    t.integer "pantry_order", limit: 1
    t.integer "loft_order", limit: 1
    t.integer "void_order", limit: 1
    t.integer "laundry_room_order", limit: 1
    t.integer "garden_order", limit: 1
    t.integer "parking_number_order"
    t.string "car_model_order"
    t.integer "bicycle_parking_number_order"
    t.text "request_details_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.string "postal_code", null: false
    t.integer "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_town", null: false
    t.string "address_street", null: false
    t.string "nearest_railroad", null: false
    t.string "nearest_station", null: false
    t.integer "transportation", limit: 1, default: 0, null: false
    t.string "nearest_bus_stop"
    t.integer "walking_time"
    t.integer "bus_time"
    t.integer "bus_stop_walking_time"
    t.integer "car_time"
    t.integer "building_coverage_ratio", null: false
    t.integer "floor_area_ratio", null: false
    t.boolean "land_use", default: false, null: false
    t.string "real_estate_name", null: false
    t.string "real_estate_staff"
    t.string "real_estate_telephone", null: false
    t.text "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
