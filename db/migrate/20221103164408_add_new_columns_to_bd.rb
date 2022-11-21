class AddNewColumnsToBd < ActiveRecord::Migration[5.2]
  def change
    add_column :building_details, :infokey, :string
  end
  def change 
    add_column :building_details, :value, :string
  end
end
