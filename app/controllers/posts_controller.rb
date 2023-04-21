class PostsController < ActionController::Base
  before_action :user
  before_action :comments

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:post_id])
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def comments
    @comments = Comment.where(post_id: params[:post_id])
  end
end
