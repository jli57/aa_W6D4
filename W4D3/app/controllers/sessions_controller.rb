class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = user.new(user_params)
    
  end
  
  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end