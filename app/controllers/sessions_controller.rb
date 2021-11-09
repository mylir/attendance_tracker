class SessionController < ApplicationController
  
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)&.authenticate(password)
    if user
      session[:current_user] = user
      redirect_to users_path, notice: 'Successfully logged in'
    else
      redirect_to login_path, alert: 'email or password incorrect'
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to login_path, notice: 'Successfully logged out'
  end
end
