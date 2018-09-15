class   Account < ApplicationRecord
  validates :name, :presence => true
  validates :current_balance, :presence => true
  belongs_to :user
  has_many :transactions

  after_create :create_initial_transaction

  def create_initial_transaction
    if current_balance > 0
      initial_transaction = Transaction.new(
          transaction_type: Transaction::INCOME,
          name: I18n.t("user.account.initial_transaction_name"),
          description: "",
          amount: current_balance,
          account_id: id
      )
      # Remove current balance, so it can be added as part of the initial transaction
      self.current_balance = 0
      self.save!
      initial_transaction.save!
    end
  end
end
