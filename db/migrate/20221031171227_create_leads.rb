class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :company_name
      t.string :email
      t.string :phone
      t.string :project_name
      t.string :project_description
      t.string :department_of_elevators
      t.string :message
      t.string :attachment
      t.datetime :date_of_contact_request

      t.timestamps
    end
  end
end
