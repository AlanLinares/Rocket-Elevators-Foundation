class AddColumnToB < ActiveRecord::Migration[5.2]
  def change
    add_column :batteries, :building_type, :string, after: :columns_id
  end
end
