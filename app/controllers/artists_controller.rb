class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))

        if @artist.save
            redirect_to artist_path(@artist)
        else
            render 'new'
        end
    end

    def show
    end

    def index
        @artists = Artist.all
    end

    def edit
    end

    def update
        if @artist.update(artist_params(:name, :bio))
            redirect_to artist_path(@artist)
        else
            render 'edit'
        end
    end

    def destroy
    end


    private

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end

    def set_artist
        @artist = Artist.find(params[:id])
    end
end