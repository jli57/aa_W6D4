class CatRentalRequestsController < ApplicationController
  def index
    render json: CatRentalRequest.all
  end

  def new
    render :new
  end
end
