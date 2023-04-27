class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @current = current_user
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash.now[:success] = 'Post created successfully'
      redirect_to user_post_url(current_user, @post)
    else
      flash[:error] = 'Error: Post not created'
      redirect_to new_user_post_url(current_user)
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
