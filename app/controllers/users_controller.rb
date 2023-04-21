class UsersController < ActionController::Base
  before_action :get_posts
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
   
  private
  def get_posts
    @posts = Post.where(author_id: params[:id])
  end
end
