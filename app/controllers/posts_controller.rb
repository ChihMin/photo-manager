class PostsController < ApplicationController
  def index
    @photos = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    params[:images].each do |image|
      @post = Post.create(avatar: image)
      print "\n -------> #{image} <------- \n"
    end
    redirect_to posts_path
  end

  def upload
  end

  def destroy
  end

private
  
  def post_params
    params.require(:post).permit(:description, :avatar)
  end
end
