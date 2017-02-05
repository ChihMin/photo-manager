class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
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
