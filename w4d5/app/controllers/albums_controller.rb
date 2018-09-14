class AlbumsController < ApplicationController
  before_action :find_album, only: [:edit, :update, :destroy, :show]
  before_action :find_band, only: [:new]

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(@album.band_id)
    end
  end

  def show
    @band = Band.find(@album.band_id)
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @album.update(album_params)
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    band_id = @album.band_id
    if @album.destroy
      redirect_to band_url(band_id)
    else
      flash[:errors] = ["Album Couldn't Be Deleted"]
      redirect_to album_url(@album)
    end
  end

  private

  def find_album
    @album = Album.find_by(id: params[:id])
  end

  def find_band
    @band = Band.find_by(id: params[:band_id])
  end

  def album_params
    params.require(:album).permit(:title, :band_id, :yr, :live)
  end

end
