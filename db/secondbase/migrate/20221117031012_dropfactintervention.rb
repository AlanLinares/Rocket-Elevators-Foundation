class Dropfactintervention < ActiveRecord::Migration[5.2]
  def change
    drop_table :fact_interventions
  end
end
