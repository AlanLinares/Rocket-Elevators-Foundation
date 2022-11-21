class MoreChangesToBd < ActiveRecord::Migration[5.2]
  def change
    add_column :building_details, :infokey, :string

    remove_column :building_details, :number_of_floors
    remove_column :building_details, :building_type
    remove_column :building_details, :architecture
    remove_column :building_details, :max_occupancy
  end
end
