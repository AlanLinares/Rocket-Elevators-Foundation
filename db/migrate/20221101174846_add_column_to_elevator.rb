class AddColumnToElevator < ActiveRecord::Migration[5.2]
  def change
    add_reference :elevators, :column, foreign_key: true, first: true
  end
end
