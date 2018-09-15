class AddDateToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :date, :date, :null => false
  end
end
