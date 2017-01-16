class LoginController < ApplicationController
  def index
  end

  def new

  end

  def create
    @business = Business.find_by(:email => params[:login][:email])
      if @business && @business.authenticate(params[:login][:password])
        session[:business_id] = @business.id
        redirect_to root_url
      else
        flash[:error] = "Email or password is invalid"
        render login_new_path
      end
  end

  def destroy
    session[:business_id] = nil
    redirect_to root_url
  end

end
