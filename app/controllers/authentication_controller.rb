class AuthenticationController < ApplicationController

  def new
  end

  def create
    if user.authenticate(params[:password])
      p 'user has been authenticated'
      render json: { token: user.fetch_auth_token!, user: user }, status: :ok
    else
      render json: {}, status: :unauthorized
    end
  end

  private

  def user
    @user ||= User.find_by_email params[:email]
  end
end
