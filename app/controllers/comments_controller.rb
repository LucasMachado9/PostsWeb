class CommentsController < ApplicationController
  def create
    payload = params.require(:comment).permit(:post_id, :content, :tags)
    @comment = Comment.create(payload)
    redirect_to @comment.post
  end

  def show
    @comment = Comment.find(params[:id])
    @comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post
  end
end
