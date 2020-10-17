class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find_by_id(params[:id])
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new
        @artist.name = params[:artist][:name]
        @artist.bio = params[:artist][:bio]
        @artist.save
        redirect_to new_artist_path
    end

    def edit
        @artist = Artist.find_by_id(params[:id])
    end

    def update
        @artist = Artist.find_by_id(params[:id])
        @artist.update(params.require(:artist).permit(:name, :bio))
        redirect_to edit_artist_path(@artist)
    end

end