class AlbumsController < ApplicationController
  before_action :require_login

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new(band_id: params[:id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album.band
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to @album
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy!
    redirect_to album.band
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :live)
  end

end
