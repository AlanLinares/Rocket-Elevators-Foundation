class Removecompanyfromquotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :company_name
  end
end
