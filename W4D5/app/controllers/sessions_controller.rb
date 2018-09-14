class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]
  before_action :require_logout, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid login credentials. Stop sucking."]
      redirect_to  new_session_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def require_logout
    redirect_to users_url if logged_in?
  end
end
