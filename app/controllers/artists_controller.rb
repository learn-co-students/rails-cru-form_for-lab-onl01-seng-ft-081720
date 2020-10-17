class ArtistsController < ApplicationController
  before_action :set_artist, only: [:edit, :show, :create, :update]

  def show
  end

  def create
    @artist = Artist.new(set_params)
    if @artist.save
      redirect_to @artist
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @artist
      @artist.update(set_params)
      redirect_to @artist
    else
      render "edit"
    end
  end

  def new
    @artist = Artist.new
  end

  private

  def set_artist
    @artist = Artist.find_by_id(params[:id])
  end

  def set_params
    params.require(:artist).permit(:name, :bio)
  end
end
