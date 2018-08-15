class PostsController < ApplicationController
  before_action :authorize, only: [:new]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Thanks, your post is has been added to the list!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.update!(post_params)
      flash[:notice] = "Good job! Your post was updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :post_title, :post_body)
  end
end
