class AddColumns < ActiveRecord::Migration[5.2]
  # def change
  #   add_column :batteries, :building_type, :string, after: :columns_id
  # end

  def change
    add_column :elevators, :building_type, :string, after: :model
  end
end
