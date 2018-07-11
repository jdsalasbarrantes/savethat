Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end

  root to: 'home#index'
  get 'dashboard' => 'dashboard#index'
end
