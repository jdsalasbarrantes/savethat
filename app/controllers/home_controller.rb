class HomeController < ApplicationController
  # Handle incoming requests to the root address
  def index
    if user_signed_in?
      redirect_to '/accounts'
    else
      redirect_to '/login'
    end
  end
end
