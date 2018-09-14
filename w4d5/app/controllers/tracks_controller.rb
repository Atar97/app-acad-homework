class TracksController < ApplicationController
  before_action :find_track, only: [:destroy, :show, :edit, :update]
  def show
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  private
  
  def track_params
    params.require(:track).permit(:title, :lyrics, :ord, :regular, :album_id)
  end

  def find_track
    @track = Track.find(params[:id])
  end

end
