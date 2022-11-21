class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.string :number_of_apartments
      t.string :number_of_floors
      t.string :number_of_basements
      t.string :number_of_companies
      t.string :number_of_parking_spots
      t.string :number_of_elevators
      t.string :number_of_corporations
      t.string :max_occupancy
      t.string :business_hours
      t.string :quality
      t.string :elevator_amount
      t.string :elevator_unit_price
      t.string :elevator_total_price
      t.string :installation_fees
      t.string :final_price

      t.timestamps
    end
  end
end
