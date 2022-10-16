class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @users_count = User.count
    @posts_count = Post.count
  end

  def new
    @post = Post.new
  end

  def create
    payload = params.require(:post).permit(:title, :content, :tags)
    @post = Post.new(payload)
    @post.user_id = current_user.id
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @show = @post.comments.index
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    payload = params.require(:post).permit(:title, :content, :tags)
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(payload)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :root
  end
end
