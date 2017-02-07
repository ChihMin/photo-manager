class PostsController < ApplicationController
  before_action :find_album
  before_action :authenticate_user!
   
  def index
    @photos = Post.all
  end

  def new
    @post = @album.posts.build
  end

  def edit
  end

  def create
    has_photo = false
    params[:images].each do |image|
      @post = @album.posts.create(avatar: image)
      has_photo = true
    end
    
    if has_photo
      current_album = @album
      while current_album != nil
        current_album.update(photo: @post.avatar.url)
        current_album = current_album.album
      end
    end
    redirect_to album_path(@album)
  end

  def upload
  end

  def destroy
  end

private

  def post_params
    params.require(:post).permit(:description, :avatar)
  end

  def find_album
    @album = Album.find(params[:album_id])
  end
end
