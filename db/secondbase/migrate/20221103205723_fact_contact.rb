class FactContact < ActiveRecord::Migration[5.2]
  def change

    create_table :fact_contacts do |t|
      t.string :contact_id
      t.string :creation_date
      t.string :company
      t.string :email
      t.string :project_name

       end
end
end
