class ArtistsController < ApplicationController

before_action :set_artist, only: [:show, :edit, :update]

    def show
    end

    def new
        @artist = Artist.new
    end

    def edit
    end

    def create
        @artist = Artist.new(artist_params)
        @artist.save
        redirect_to artist_path(@artist)
    end

    def update
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end

    def set_artist
        @artist = Artist.find_by_id(params[:id])
    end

end
