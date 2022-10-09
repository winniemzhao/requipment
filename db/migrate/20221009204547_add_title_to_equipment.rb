class AddTitleToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :title, :string
  end
end
