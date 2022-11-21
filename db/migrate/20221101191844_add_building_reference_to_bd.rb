class AddBuildingReferenceToBd < ActiveRecord::Migration[5.2]
  def change
    add_reference :building_details, :building,  foreign_key: true, first: true
  end
end
