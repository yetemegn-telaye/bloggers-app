class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post
    if @comment.save
      render json: @comment, status: :created, location: @comment
      flash[:success] = 'Comment created successfully'
      redirect_to user_post_url(@post.author, @post)
    else
      render json: @comment.errors, status: :unprocessable_entity
      flash[:error] = 'Error: Comment not created'
      redirect_to new_user_post_comment_url(@post.author, @post)
    end
  end

  def destroy
    @post = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment deleted successfully'
    redirect_to user_post_path(@comment.post.author, @comment.post), notice: 'Comment deleted successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
