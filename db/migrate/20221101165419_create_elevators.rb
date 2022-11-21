class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :serial_numbers
      t.string :model
      t.string :type
      t.string :status
      t.datetime :date_of_commissioning
      t.datetime :date_of_last_inspection
      t.string :certificate_of_inspection
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
