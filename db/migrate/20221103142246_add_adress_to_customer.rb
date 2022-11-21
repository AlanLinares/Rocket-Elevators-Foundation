class AddAdressToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :address, foreign_key: true
    add_reference :buildings, :customer, foreign_key: true
  end
end
