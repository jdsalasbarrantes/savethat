class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.string :name
      t.text :description
      t.decimal :amount
      t.references :account

      t.timestamps
    end
  end
end
