class BandsController < ApplicationController
  before_action :find_band, only: [:destroy, :show, :update, :edit]
  def index
    @bands = Band.all
    render :index
  end

  def show
    if @band
      render :show
    else
      redirect_to bands_url
    end
  end

  def destroy
    unless @band.destroy
      flash[:errors] = ["The Band Couldn't Be Deleted"]
    end
    redirect_to bands_url
  end

  def update
    if @band
      @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = ["The Band You Are Editing Doesn't Exist"]
      render :edit
    end
  end

  def edit
    render :edit
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  private

  def find_band
    @band = Band.find_by(id: params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end

end
