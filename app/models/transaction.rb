class Transaction < ApplicationRecord
  validates :name,  :presence => true
  validates :amount,  :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :transaction_type,  :presence => true
  validates :date, :presence => true
  belongs_to :account

  OUTCOME = "outcome"
  INCOME = "income"
  TYPES = [OUTCOME, INCOME]

  after_create :update_account_balance_on_create
  before_update :update_account_balance_on_update
  before_destroy :update_account_balance_on_destroy

  def update_account_balance_on_create
    update_account_balance(transaction_type, amount,false)
  end

  def update_account_balance_on_destroy
    update_account_balance(transaction_type, amount, true)
  end

  def update_account_balance_on_update
    if transaction_type_changed? or amount_changed?
      old_amount = amount_was || amount
      old_transaction_type = transaction_type_was || transaction_type
      update_account_balance(old_transaction_type, old_amount, true)
      update_account_balance(transaction_type, amount, false)
    end
  end

  def self.order_by_date
    order(date: :desc)
  end

  def self.this_month
    where(:date => Date.current.beginning_of_month..Date.current.end_of_month)
  end

  private

  def update_account_balance(transaction_type, amount, reduce = false)
    if transaction_type == Transaction::INCOME
      account.current_balance += amount unless reduce
      account.current_balance -= amount if reduce
    else
      account.current_balance -= amount unless reduce
      account.current_balance += amount if reduce
    end
    account.save!
  end


end
