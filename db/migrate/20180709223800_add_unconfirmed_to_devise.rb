class AddUnconfirmedToDevise < ActiveRecord::Migration[5.2]
  def change
    change_table(:user) do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
    end
  end
end
