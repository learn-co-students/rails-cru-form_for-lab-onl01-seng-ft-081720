class GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :show, :create, :update]

  def show
  end

  def create
    @genre = Genre.new(set_params)
    if @genre.save
      redirect_to @genre
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @genre
      @genre.update(set_params)
      redirect_to @genre
    else
      render "edit"
    end
  end

  def new
    @genre = Genre.new
  end

  private

  def set_genre
    @genre = Genre.find_by_id(params[:id])
  end

  def set_params
    params.require(:genre).permit(:name)
  end
end
