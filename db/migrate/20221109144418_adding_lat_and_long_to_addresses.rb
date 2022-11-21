class AddingLatAndLongToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :lat, :string
    add_column :addresses, :lng, :string


  end
end
