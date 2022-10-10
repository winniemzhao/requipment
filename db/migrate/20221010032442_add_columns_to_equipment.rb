class AddColumnsToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :product, :string
    add_column :equipment, :population, :string
  end
end
