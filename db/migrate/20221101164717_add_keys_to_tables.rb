class AddKeysToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :building, foreign_key: true, first: true
    add_reference :columns, :battery, foreign_key: true, first: true
    add_reference :batteries, :employee, foreign_key: true, first: true
    add_reference :buildings, :address,  foreign_key: true, first: true
  end
end

