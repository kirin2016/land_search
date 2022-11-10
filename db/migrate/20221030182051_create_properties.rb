class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_town, null: false
      t.string :address_street, null: false
      t.string :nearest_railroad, null: false
      t.string :nearest_station, null: false
      t.integer :transportation, null: false, default: 0, limit: 1
      t.string :nearest_bus_stop
      t.integer :walking_time
      t.integer :bus_time
      t.integer :bus_stop_walking_time
      t.integer :car_time
      t.integer :building_coverage_ratio, null: false
      t.integer :floor_area_ratio, null: false
      t.boolean :land_use, null: false, default: false
      t.string :real_estate_name, null: false
      t.string :real_estate_staff
      t.string :real_estate_telephone, null: false
      t.text :introduction

      t.timestamps null: false
    end
  end
end
