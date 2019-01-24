class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_order

  def current_user
    if logged_in?
      User.find(session[:user_id])
    else
      nil
    end
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def logged_in?
    if session[:user_id] === nil
      false
    else
      true
    end
  end

  def require_log_in
    if current_user === nil
      redirect_to login_path
    end
  end


end
