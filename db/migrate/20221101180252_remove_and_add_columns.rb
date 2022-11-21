class RemoveAndAddColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :elevators, :type
  end
  def change
    remove_column :batteries, :type
  end
  def change
    remove_column :columns, :type
  end

  def change
    add_column :elevators, :building_type, :string, after: :model
  end
  
  def change
    add_column :batteries, :building_type, :string, after: :column_id
  end

  def change
    add_column :columns, :building_type, :string, after: :battery_id
  end



end
