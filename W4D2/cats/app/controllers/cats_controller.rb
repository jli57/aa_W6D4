class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      render :show
    else
      # debugger
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    # render json: @cat
    render :edit
    # if @cat
    #   render :edit
    # else
    #   redirect_to :index
    # end
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update_attributes(cat_params)
      render :show
    else
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

end
