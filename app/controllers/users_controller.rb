class UsersController < ActionController::Base
  before_action :posts
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def posts
    @posts = Post.where(author_id: params[:id])
  end
end
