class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end
    
    def show
        @artist = Artist.find_by_id(params[:id])
    end

    def create
        @artist = Artist.create(artist_params)
        redirect_to artist_path(@artist)
    end
    
    def update
        @artist = Artist.find_by_id(params[:id])
        if @artist
            @artist.update(artist_params)
            redirect_to @artist
        else
            render "new"
        end

    end


    def edit
        @artist = Artist.find_by_id(params[:id])
        
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end


end
