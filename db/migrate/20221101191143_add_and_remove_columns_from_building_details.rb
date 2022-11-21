class AddAndRemoveColumnsFromBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :building_details, :information_key
    remove_column :building_details, :value

    add_column :building_details, :number_of_floors, :string
    add_column :building_details, :building_type, :string
    add_column :building_details, :architecture, :string
    add_column :building_details, :max_occupancy, :string
    add_column :building_details, :construction_year, :datetime

  end
end
