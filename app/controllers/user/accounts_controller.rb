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
    @account.user = current_user
    if @account.save
      flash[:notice] = I18n.t("user.account.new.created")
      redirect_to account_path(@account)
    else
      flash[:alert] = display_active_record_error(@account, I18n.t("user.account.new.error"))
      render :new
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
    @transactions = @account.transactions.order_by_date
  end

  def destroy
    @account.destroy!
    flash[:notice] = I18n.t("user.account.destroy.destroyed")
    redirect_to action: "index"
  end

  private

  def account_params_on_create
    params.require(:account).permit(:name, :current_balance)
  end

  def account_params_on_update
    params.require(:account).permit(:name)
  end
end

