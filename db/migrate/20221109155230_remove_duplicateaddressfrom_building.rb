class RemoveDuplicateaddressfromBuilding < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :address
  end
end
