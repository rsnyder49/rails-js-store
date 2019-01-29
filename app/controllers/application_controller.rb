class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_order
  helper_method :admin?

  def current_user
    if logged_in?
      User.find_by(id: session[:user_id])
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

  def admin?
    if current_user
      current_user.admin
    else
      nil
    end
  end

  def admin_only
    if !admin?
      flash[:error] = "Only Administrators can access that page."
      redirect_to items_path
    end
  end

end
