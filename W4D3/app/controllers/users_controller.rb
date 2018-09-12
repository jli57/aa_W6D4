class UsersController < ApplicationController
  def new
    user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    
    @user.reset_session_token!
    
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url 
    end
  end 
  
  def show
    # debugger
    @user = User.find_by(id: params[:id])
    render :show
  end 
  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end 
end 