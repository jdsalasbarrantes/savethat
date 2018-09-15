Rails.application.routes.draw do
  devise_for :user, :controllers => {registrations: "custom_devise/registrations" }, path: "", path_names: {sign_in: "login", sign_out: "logout"}
  devise_scope :user do
    get "logout", to: "devise/sessions#destroy"
  end

  root to: "home#index"

  get "dashboard" => "user/dashboard#index"

  resources :accounts, controller: "user/accounts"
  resources :transactions, controller: "user/transactions"
end
