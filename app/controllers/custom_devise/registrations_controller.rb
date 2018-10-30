class CustomDevise::RegistrationsController < Devise::RegistrationsController
  # Custom registration controller extended from devise to add first_name and last_name as part of the user creation
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end