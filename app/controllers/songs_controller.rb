class SongsController < ApplicationController
  def search
    # GET /search?query=thriller
    # params[:query] ---> "thriller"
    @songs = Song.where(title: params[:query])
    # @songs = Song.where("title LIKE %#{params[:query]}%")
  end

  def search2
    # GET /songs/named/thriller
    @songs = Song.where(title: params[:name])
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
