class ChangeTodatetimemoreaddcolumns < ActiveRecord::Migration[5.2]
  def change
    add_column :fact_contacts, :creation_date, :datetime, after: :contact_id
    add_column :fact_quotes, :creation, :datetime, after: :quote_id
    add_column :fact_elevator, :date_of_commissioning, :datetime, after: :serial_number
  end
end
