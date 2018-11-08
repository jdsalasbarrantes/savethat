class User::AccountsController < User::BaseController
  include ApplicationHelper
  before_action :load_account

  def load_account
    if params[:id]
      @account = current_user.accounts.find(params[:id])
    end
  end

  def index
    @accounts = current_user.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params_on_create)
    @account.users = [current_user]
    if @account.save
      flash[:notice] = I18n.t("user.account.new.created")
      redirect_to account_path(@account)
    else
      flash[:alert] = display_active_record_error(@account, I18n.t("user.account.new.error"))
      render :new
    end
  end

  def new_existing
  end

  def create_existing
    code = params[:code]
    account = Account.where(code: code).first
    if account
      if account.user_ids.include?(current_user.id)
        flash[:alert] = I18n.t("user.account.new_existing.already_added", account: account.name)
        render :new_existing
      else
        account.users = account.users.push(current_user)
        account.save
        redirect_to account_path(account)
      end
    else
      flash[:alert] = I18n.t("user.account.new_existing.error")
      render :new_existing
    end
  end

  def edit

  end

  def update
    if @account.update(account_params_on_update)
      flash[:notice] = I18n.t("user.account.edit.updated")
      redirect_to account_path(@account)
    else
      flash[:alert] = display_active_record_error(@account, I18n.t("user.account.edit.error"))
      render :edit
    end
  end

  def show
    @transactions = @account.transactions.order_by_date.page(params[:page])
    @top_boxes = [
        [I18n.t("user.account.model.current_balance"), display_money_value(@account.current_balance, @account)],
        [I18n.t("user.account.model.this_month_incomes"), display_money_value(@account.transactions.this_month.where(transaction_type: Transaction::INCOME).sum(:amount), @account)],
        [I18n.t("user.account.model.this_month_expenses"), display_money_value(@account.transactions.this_month.where(transaction_type: Transaction::OUTCOME).sum(:amount), @account)],
    ]
  end

  def destroy
    @account.destroy!
    flash[:notice] = I18n.t("user.account.destroy.destroyed")
    redirect_to action: "index"
  end

  private

  def account_params_on_create
    params.require(:account).permit(:name, :currency, :current_balance)
  end

  def account_params_on_update
    params.require(:account).permit(:name)
  end
end

