class DashboardController < ApplicationController
  layout 'user'
  before_action :authenticate_user!
  def index
  end
end
