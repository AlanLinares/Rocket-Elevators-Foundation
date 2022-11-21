class FactQuote < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.string :quote_id
      t.string :creation
      t.string :email
      t.string :nbElevator
     
      t.timestamps
  end
end
end
