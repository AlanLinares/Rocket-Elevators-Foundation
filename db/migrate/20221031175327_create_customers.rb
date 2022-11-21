class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.datetime :customer_creation_date
      t.string :company_name
      t.string :company_address
      t.string :contact_full_name
      t.string :company_contact_phone
      t.string :company_contact_email
      t.string :company_description
      t.string :service_tech_full_name
      t.string :service_tech_phone
      t.string :tech_manager_email

      t.timestamps
    end
  end
end
