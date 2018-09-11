class ArtworksController < ApplicationController
  def index
    artworks = Artwork.all
    render json: artworks
    # render json: params
  end

  def create
    artwork = Artwork.new(artwork_params)
    #
    # render json: params
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end

  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork
    else
      render plain: "What is that", status: 422
    end
  end

  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end
  end


  def destroy
    artwork = Artwork.find(params[:id])

    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end
  end


  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url)
  end
end
