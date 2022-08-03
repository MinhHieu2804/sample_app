class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      handle_login user
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
  def handle_login user
    if user.activated?
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to user
    else
      flash[:warning] = t ".user_mailer.mess"
      redirect_to root_url
    end
  end
end
