class ChangeTodatetime < ActiveRecord::Migration[5.2]
  def change
    remove_column :fact_quotes, :creation
  end
end
