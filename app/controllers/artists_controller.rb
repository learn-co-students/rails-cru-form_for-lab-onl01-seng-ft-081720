class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update]

    def new 
        @artist = Artist.new 
    end 

    def create
        @artist = Artist.create(artist_params)
        redirect_to artist_path(@artist)
    end 

    def show
        @artist
    end 

    def edit 
        @artist
    end 

    def update
      @artist.update(artist_params)
      redirect_to artist_path(@artist)
    end 



    private

    def set_artist
        @artist = Artist.find_by_id(params[:id])
    end 

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end 
end
