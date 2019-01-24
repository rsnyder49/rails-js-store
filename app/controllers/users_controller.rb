class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      session[:user_id] = user.id
      @user = user
      @user.save!
      redirect_to user_path(@user.id)
    else
      @user = user
      redirect_to 'users/new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :balance)
  end

end
