class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :property_id, null: false
      t.string :image_id, null: false
      t.string :explanation

      t.timestamps null: false
    end
  end
end
