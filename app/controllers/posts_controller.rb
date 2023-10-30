class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = User.post.includes(:comments).paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
    @post = @user.post.fing(params[:id])
    @comments = @post.comments.includes(:author).paginate(page: params[:page], per_page: 10)
    @comments_count = @post.likes.size
  end
end
