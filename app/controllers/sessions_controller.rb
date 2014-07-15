class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have logged in #{current_user.username}"
      redirect_to root_path
    else
      flash[:error] = 'Access Denied.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = 'You have logged out'
    redirect_to root_path
  end

end