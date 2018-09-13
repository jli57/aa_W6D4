class AlbumsController < ApplicationController
  def new
    render :new
  end
  
  def create
    @album = Album.new(album_params)
    
    if @album.save
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end
  
  def show
    render :show
  end
  
  
  
  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end