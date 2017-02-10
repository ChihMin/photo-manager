class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @albums = Album.where(level: 0)
    @usage = `du -sh`.split()[0] + "B" 
  end

  def show
    @album = Album.find(params[:id])
    if @album.privated
      authenticate_user!
    end 
    @albums = @album.albums
	@album_list = Array.new
	current_album = @album
	while current_album != nil 
      @album_list << current_album
	  current_album = current_album.album
    end
    @album_list.reverse!
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
    @album.privated = false
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
  
  def set_private
    @album = Album.find(params[:id])
    if @album.privated == true
      @album.update(privated: false)
    else
      @album.update(privated: true)
    end
    redirect_to album_path(@album)
  end
   
  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(@album)
    else
      render :edit
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
