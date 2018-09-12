class UsersController < ApplicationController
  def new
    user = User.new
    render :new
  end
  
  def create
    
    @user = User.new(user_params)
    
    @user.reset_session_token!
    
    if @user.save
      render json: "great job champ!"   #log them in
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_url 
    end
  end 
  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end 
end 