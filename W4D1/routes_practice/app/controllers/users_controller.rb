class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
    # render json: params
  end

  def create
    render json: params
  end
end
1
