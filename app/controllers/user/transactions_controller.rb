class User::TransactionsController < User::BaseController

  before_action :load_transaction


  def load_transaction
    if params[:id]
      @transaction = current_user.transactions.find(params[:id])
    end
  end

  def index
    @transactions = current_user.transactions.order_by_date
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params_on_create)
    if @transaction.save
      flash[:notice] = I18n.t("user.transaction.new.created")
      redirect_to account_path(@transaction.account)
    else
      flash[:alert] = I18n.t("user.transaction.new.error")
      redirect_back(fallback_location: url_for(action: "new"))
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params_on_update)
      flash[:notice] = I18n.t("user.transaction.edit.created")
      redirect_to account_path(@transaction.account)
    else
      flash[:alert] = I18n.t("user.transaction.edit.error")
      redirect_back(fallback_location: url_for(action: "edit"))
    end
  end

  def destroy
    @transaction.destroy!
    flash[:notice] = I18n.t("user.transaction.destroy.destroyed")
    redirect_to account_path(@transaction.account)
  end

  private

  def transaction_params_on_create
    params.require(:transaction).permit(:transaction_type, :name, :description, :amount, :account_id, :date)
  end

  def transaction_params_on_update
    params.require(:transaction).permit(:transaction_type, :name, :description, :amount, :account_id, :date)
  end
end

