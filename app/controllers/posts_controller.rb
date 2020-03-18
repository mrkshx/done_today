class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts_today = Post.where(created_at: Date.today.all_day)
    @posts_yesterday = Post.where(created_at: Date.yesterday.all_day)
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
