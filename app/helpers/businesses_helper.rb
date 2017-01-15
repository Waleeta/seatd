module BusinessesHelper
  def current_business
    @current_business ||= Business.find(session[:business_id])
  end

  def logged_in?
    session[:business_id] != nil
  end

  def owner?
    current_business == session[:business_id]
  end

  def authenticate!
   redirect_to root_url unless logged_in? && current_user
  end

end
