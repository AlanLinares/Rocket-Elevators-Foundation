class Changefactelevator < ActiveRecord::Migration[5.2]
  def change
    rename_table :fact_elevator, :fact_elevators
  
  end
end
