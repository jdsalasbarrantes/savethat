class AddCodeToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :code, :string, index: true, :null => false
  end
end
