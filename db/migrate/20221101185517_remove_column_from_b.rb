class RemoveColumnFromB < ActiveRecord::Migration[5.2]
  def change
    remove_column :batteries, :type
  end
end
