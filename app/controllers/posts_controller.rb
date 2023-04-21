class PostsController < ActionController::Base
  before_action :get_user
  before_action :get_comments

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:post_id])
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def get_comments
    @comments = Comment.where(post_id: params[:post_id])
  end
  
end
