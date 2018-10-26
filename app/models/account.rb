class   Account < ApplicationRecord
  validates :name, :presence => true
  validates :current_balance, :presence => true
  has_many :transactions
  has_and_belongs_to_many :users
  ACCOUNT_CODE_LENGTH = 8

  after_create :create_initial_transaction
  before_create :generate_code

  def generate_code
    self.code = SecureRandom.hex(ACCOUNT_CODE_LENGTH)
  end

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
