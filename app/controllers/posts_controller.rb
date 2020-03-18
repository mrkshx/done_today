class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tag_id)
  end
end
