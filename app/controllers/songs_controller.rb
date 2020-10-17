class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find_by_id(params[:id])
        @artist = Artist.find_by_id(params[:id])
        @genre = Genre.find_by_id(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new
        @song.name = params[:song][:name]
        @song.save
        redirect_to new_song_path
    end

    def edit
        @song = Song.find_by_id(params[:id])
    end

    def update
        @song = Song.find_by_id(params[:id])
        @song.update(params.require(:song).permit(:name))
        redirect_to edit_song_path(@song)
    end
    
end