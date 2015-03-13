class TracksController < ApplicationController
  before_action :require_login

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new(album_id: params[:id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to @track.album
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to @track
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy!
    redirect_to track.album
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :bonus, :lyrics)
  end

end
