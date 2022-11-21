class Test < ActiveRecord::Migration[5.2]
  
    def change
      create_table :test do |t|
        t.datetime :creation_date
        t.string :company_name
        t.string :full_name_of_company_contact
        t.string :email_of_company_contact
        t.string :nb_elevators
        t.string :customer_city
  
         end
    
  end
end
