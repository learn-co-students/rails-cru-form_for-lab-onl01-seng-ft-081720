class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params(:name, :artist_id, :genre_id))

        if @song.save
            redirect_to song_path(@song)
        else
            render 'new'
        end
    end

    def show
    end

    def index
        @songs = Song.all
    end

    def edit
    end

    def update
        if @song.update(song_params(:name, :artist_id, :genre_id))
            redirect_to song_path(@song)
        else
            render 'edit'
        end
    end

    def destroy
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def set_song
        @song = Song.find(params[:id])
    end
end