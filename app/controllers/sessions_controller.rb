class SessionsController < ApplicationController
  # skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_index_path
    else
      redirect_to login_path, alert: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_path, notice: 'Logged out'
  end
end
