class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
    # render json: params
  end

  def create
    user = User.new(user_params)
    #
    # render json: params
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end

  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render plain: "What is that", status: 422
    end
  end






  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
