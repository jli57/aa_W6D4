class ArtworkSharesController < ApplicationController
  def index
    artworkshares = ArtworkShare.all
    render json: artworkshares
    # render json: params
  end

  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    #
    # render json: params
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end

  end

  def show
    artwork_share = ArtworkShare.find_by(id: params[:id])
    if artwork_share
      render json: artwork_share
    else
      render plain: "What is that", status: 422
    end
  end

  def update
    artwork_share = ArtworkShare.find(params[:id])

    if artwork_share.update(artwork_share_params)
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages
    end
  end


  def destroy
    artwork_share = ArtworkShare.find(params[:id])

    if artwork_share.destroy
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages
    end
  end


  private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
