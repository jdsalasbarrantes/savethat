class User::AccountsController < User::BaseController

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
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      flash[:notice] = I18n.t("user.account.new.created")
      redirect_to account_path(@account)
    else
      flash[:alert] = I18n.t("user.account.new.error")
      redirect_back(fallback_location: url_for(action: "new"))
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

  def account_params
    params.require(:account).permit(:name, :current_balance)
  end
end

