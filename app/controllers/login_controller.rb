class LoginController < ApplicationController
  def index
  end

  def new
    # @business = Business.find_by(email: params[:email])
    # p @business
    # p "Business found"
  end

  def create
    @business = Business.find_by(:email => params[:login][:email])
    p "business found"
      if @business && @business.authenticate(params[:login][:password])
        session[:business_id] = @business.id
        redirect_to root_url
      else
        flash[:error] = "Email or password is invalid"
        render login_new_path
      end
  end

  def destroy
    p "delete"
    session[:business_id] = nil
    redirect_to root_url
  end

end
