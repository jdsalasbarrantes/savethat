class AddManyToManyRelationForAccountsAndUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :user_id

    create_table :accounts_users, id: false do |t|
      t.belongs_to :account, index: true
      t.belongs_to :user, index: true
    end

  end
end