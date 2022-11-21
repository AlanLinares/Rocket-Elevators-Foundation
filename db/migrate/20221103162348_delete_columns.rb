class DeleteColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :building_details, :building_type
 
  end

  def change
    remove_column :building_details, :number_of_floors
  
  end

  def change
    remove_column :building_details, :architecture
    
  end

  def change
    remove_column :building_details, :max_occupancy
    
  end

  def change
    remove_column :building_details, :construction_year
  end
end