class SongsController < ApplicationController
    before_action :set_song, only:[:show, :edit, :update, :destroy] # To be able to use the strong params

    def index # implicit rendering
        @songs = Song.all # List all the songs 
    end

    def new
        @song = Song.new # create a new song
    end

    def show
    end

    def create # implicit rendering 
        @song = Song.new(song_params) # create a new song

        if @song.valid? # check is the song is valid with the correct attributes
            @song.save
            redirect_to song_path(@song)
        else
            render :new # explicit rendering 
        end 
    end 

    def edit
    end 

    def update # implicit rendering
        if @song.update(song_params) # update the song parameters
            redirect_to song_path(@song)
        else
            render :edit # explicit rendering
        end
    end

    def destroy # implicit rendering
        @song.destroy
        redirect_to songs_path # explicit rendering
    end 

    private 

    # strong params
    def set_song
        @song = Song.find(params[:id]) 
    end

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 
end
