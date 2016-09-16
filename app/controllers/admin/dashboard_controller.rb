class Admin::DashboardController < ApplicationController
  # before_action :authenticate_user!
  # if Rails.env.production?
  #   http_basic_authenticate_with :name => ENV["ADMIN_NAME"],:password => ENV["ADMIN_PASSWORD"]
  # else
  #   http_basic_authenticate_with :name => "admin", :password => "password"
  # end

  def index
    if current_user.admin !=  true
      redirect_to tutos_path
    end
  end
end
