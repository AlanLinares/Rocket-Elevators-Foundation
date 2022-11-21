class RenameFactIntervention < ActiveRecord::Migration[5.2]
  def change
    rename_table :fact_intervention, :fact_interventions
  end
end
