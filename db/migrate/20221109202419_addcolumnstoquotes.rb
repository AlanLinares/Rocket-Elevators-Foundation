class Addcolumnstoquotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :full_name, :string
    add_column :quotes, :company_name, :string
    add_column :quotes, :email, :string
   
  end
end
