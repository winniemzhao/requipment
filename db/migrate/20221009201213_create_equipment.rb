class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :type
      t.integer :condition
      t.text :description
      t.string :location
      t.string :brand
      t.float :overall_width
      t.float :overall_height
      t.float :overall_depth
      t.float :back_height
      t.float :floor_to_seat_height
      t.float :seat_width
      t.float :seat_depth
      t.float :weight_capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
