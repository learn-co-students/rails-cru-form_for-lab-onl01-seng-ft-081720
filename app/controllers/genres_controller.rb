class GenresController < ApplicationController
    before_action :set_genre, only: [:show, :edit, :update, :destroy]

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params(:name))

        if @genre.save
            redirect_to genre_path(@genre)
        else
            render 'new'
        end
    end

    def show
    end

    def index
        @genres = Genre.all
    end

    def edit
    end

    def update
        if @genre.update(genre_params(:name))
            redirect_to genre_path(@genre)
        else
            render 'edit'
        end
    end

    def destroy
    end

    private

    def genre_params(*args)
        params.require(:genre).permit(*args)
    end

    def set_genre
        @genre = Genre.find(params[:id])
    end
end