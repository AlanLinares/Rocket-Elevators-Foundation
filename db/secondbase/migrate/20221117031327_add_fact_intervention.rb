class AddFactIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_intervention do |t|
      t.string :employee_id
      t.string :building_id
      t.string :battery_id
      t.string :column_id
      t.string :elevator_id
      t.string :result
      t.string :report
      t.string :status
      t.datetime :start_date_of_intervention
      t.datetime :end_date_of_intervention

       end
  end
end
