class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.datetime :start_datetime_of_intervention
      t.datetime :end_datetime_of_intervention
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end
