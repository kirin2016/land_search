class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_town, null: false
      t.string :address_street, null: false
      t.string :nearest_station, null: false
      t.integer :transportation, null: false, default: 0, limit: 1
      t.integer :walking_time
      t.integer :bus_time
      t.integer :car_time
      t.integer :building_coverage_ratio, null: false
      t.integer :floor_area_ratio, null: false
      t.string :introduction

      t.timestamps null: false
    end
  end
end
