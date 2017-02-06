class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.posts.all
  end

  def new
    @album = Album.new
  end
  
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

private
  
  def album_params
    params.require(:album).permit(:title, :description)
  end

  def find_album
  end
end
