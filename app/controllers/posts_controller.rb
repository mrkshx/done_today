class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.finde(params[:id])
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tag_id, :user_id)
  end
end
