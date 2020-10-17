class SongsController < ApplicationController
  before_action :set_song, only: [:edit, :show, :create, :update]

  def show
  end

  def create
    @song = Song.new(set_params)
    if @song.save
      redirect_to @song
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @song
      @song.update(set_params)
      redirect_to @song
    else
      render "edit"
    end
  end

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  private

  def set_song
    @song = Song.find_by_id(params[:id])
  end

  def set_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
