class AlbumsController < ApplicationController
  def index
    @albums = Album.where(level: 0)
  end

  def show
    @album = Album.find(params[:id])
    @albums = @album.albums
    @photos = @album.posts.page(params[:page]).per(12)
  end

  def new
    @album = Album.new
  end
  
  def new_album
    @album = Album.find(params[:album_id])
    @new_album = @album.albums.build
  end
   
  def create
    @album = Album.new(album_params)
    @album.level = 0
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def create_album
    @album = Album.find(params[:album_id])
    @new_album = @album.albums.build(album_params)
    @new_album.level = @album.level + 1
    if @new_album.save
      redirect_to album_path(@new_album)
    else
      render :new_album
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @last_album = @album.album
    @album.destroy
    if @last_album != nil
      redirect_to album_path(@last_album)
    else
      redirect_to albums_path
    end
  end

private
  
  def album_params
    params.require(:album).permit(:title, :description)
  end

  def find_album
  end
end
