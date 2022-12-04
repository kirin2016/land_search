class CreateLandPercels < ActiveRecord::Migration[6.1]
  def change
    create_table :land_percels do |t|
      t.integer :property_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.float :area, null: false
      t.integer :price_tsubo, null: false
      t.integer :shape, null: false, default: 0, limit: 1
      t.integer :connecting_road_situation, null: false, default: 0, limit: 1
      t.float :main_road_width, null: false
      t.integer :main_road_direction, null: false, default: 0, limit: 1
      t.float :frontage, null: false
      t.boolean :difference_elevation, null: false, default: false
      t.boolean :private_road_burden, null: false, default: false
      t.integer :sale_status, null: false, limit: 1
      t.string :reference_plan_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
