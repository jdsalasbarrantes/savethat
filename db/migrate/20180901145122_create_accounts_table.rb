class CreateAccountsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.decimal :current_balance, null: false, default: 0
      t.references :user
      t.timestamps null: false
    end
  end
end
