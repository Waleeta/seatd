class LoginController < ApplicationController
  def index
  end

  def new
    # @business = Business.find_by(email: params[:email])
    # p @business
    # p "Business found"
  end

  def create
    p "in create"
    @business = Business.find_by(:email => params[:login][:email])
    p @business
      if @business && @business.authenticate(params[:login][:password])
        p "business authenticated"
        session[:business_id] = @business.id
        redirect_to root_url
      else
        p "errors"
        flash[:error] = "Email or password is invalid"
        render login_new_path
      end
  end

  def destroy
  end

end
