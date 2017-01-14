module BusinessesHelper
  def current_business
    if session[:business_id] != nil
      current_business = session[business_id]
    end
  end
end
