class PostsController < ApplicationController
   def index
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
          flash.now[:success] = "Post created successfully"
          redirect_to user_post_url(current_user, @post)
        else
          flash[:error] = "Error: Post not created"
          redirect_to new_user_post_url(current_user)
        end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
