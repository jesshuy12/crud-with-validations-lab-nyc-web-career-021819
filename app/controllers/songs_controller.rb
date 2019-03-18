class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_param)
    if @song.valid?
        @song.save
        redirect_to song_path(@song.id)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_param)
       redirect_to song_path(@song)
    else
       render :edit
    end
  end

  def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to songs_path #goes to index page

      # redirect_to @song ==> go to '/songs/nil' actually goes to '/songs/""'
      #
      # redirect_to song_path => go to '/songs/7' which will break because this was deleted in the database
  end

  private

  def song_param
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
