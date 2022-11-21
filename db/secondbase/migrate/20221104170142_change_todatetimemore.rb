class ChangeTodatetimemore < ActiveRecord::Migration[5.2]
  def change
    remove_column :fact_contacts, :creation_date
    remove_column :fact_elevator, :date_of_commissioning
  end
end
