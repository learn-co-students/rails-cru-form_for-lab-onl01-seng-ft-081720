class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        redirect_to @song
    end

    def show
        @artist = Artist.find(@song.artist_id)
        @genre = Genre.find(@song.genre_id)
    end

    def edit
    end

    def update
        @song.update(song_params)
        redirect_to @song
    end
     
    private

    def set_song
        @song = Song.find_by_id(params[:id])
    end

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
