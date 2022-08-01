class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      login_and_remember_check user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def auth user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_back_or user
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def login_and_remember_check user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_to user
  end
end
