module BusinessesHelper
  def current_business
    @current_business = Business.find_by(id: session[:business_id])
  end

  def logged_in?
    session[:business_id] != nil
  end

  def owner?
    @business.id == session[:business_id]
  end

  def authenticate!
   redirect_to root_url unless logged_in? && current_business
  end

  def business_services(search_term)
    # return all the businesses in an array that match search_term
  end

end
