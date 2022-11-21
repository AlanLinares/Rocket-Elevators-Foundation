class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :elevators, :type
  end
  def change
    remove_column :batteries, :type
  end
  def change
    remove_column :columns, :type
  end
end
