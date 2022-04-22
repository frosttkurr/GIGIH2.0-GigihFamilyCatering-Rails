class UsersController < ApplicationController
  # before_action :forbid_login_user, {only: [:index, :login]}
  # Login deactivated because error implemented in RSpec
  
  # def index
  # end

  # def login
  #   @user = User.find_by(username: params[:username], password: params[:password])
  #   if @user
  #     session[:user_id] = @user.id
  #     flash[:notice] = "You have logged in successfully"
  #     redirect_to("/")
  #   else
  #     @username = params[:username]
  #     @password = params[:password]
  #     flash[:notice] = "Failed to logged in"
  #     render("users/index")
  #   end
  # end

  # def logout
  #   session[:user_id] = nil
  #   flash[:notice] = "You have logged out successfully"
  #   redirect_to("/login")
  # end
end
