class RemoveColumnId < ActiveRecord::Migration[5.2]
  def change
     remove_column :batteries, :columns_id
  end
end
