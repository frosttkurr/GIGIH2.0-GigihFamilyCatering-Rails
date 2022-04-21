class UsersController < ApplicationController

  def index
  end

  def login
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "You have logged in successfully"
      redirect_to("/")
    else
      @username = params[:username]
      @password = params[:password]
      render("users/index")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end
end
