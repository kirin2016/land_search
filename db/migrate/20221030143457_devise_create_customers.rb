# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building
      t.string :telephone_number, null: false
      t.boolean :is_deleted, null: false, default: false
      t.string :sale_staff
      t.integer :tenant_number
      t.string :tenant_member
      t.integer :house_type, limit: 1
      t.integer :total_budget
      t.integer :number_floor
      t.integer :floor_area
      t.integer :number_room
      t.integer :ldk_floor_number
      t.integer :ldk_area
      t.integer :kitchen_type, limit: 1
      t.integer :mbr_area
      t.integer :br_area
      t.integer :bathroom_area, limit: 1
      t.integer :japanese_room, limit: 1
      t.integer :storage, limit: 1
      t.integer :den, limit: 1
      t.integer :den_type, limit: 1
      t.integer :wic, limit: 1
      t.integer :family_closet, limit: 1
      t.integer :sic, limit: 1
      t.integer :pantry, limit: 1
      t.integer :loft, limit: 1
      t.integer :void, limit: 1
      t.integer :laundry_room, limit: 1
      t.integer :garden, limit: 1
      t.integer :parking_number
      t.string :car_model
      t.integer :bicycle_parking_number
      t.string :request_details

      t.timestamps null: false
    end

    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
    # add_index :customers, :confirmation_token,   unique: true
    # add_index :customers, :unlock_token,         unique: true
  end
end
