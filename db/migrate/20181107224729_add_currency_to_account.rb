class AddCurrencyToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :currency, :string, :null => false, :default => 'USD'
  end
end
