class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    log_in_params = params[:user]
    if log_in_params[:username].empty? || log_in_params[:password].empty?
      flash[:error] = "Username and Password cannot be empty, Please try again"
      redirect_to login_path
    end
    user = User.find_by(username: log_in_params[:username])
    if !user
      flash[:error] = "Invalid Username or Password"
      redirect_to signin_path
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

end
