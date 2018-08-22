class PostsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :destroy, :update]
  
  def index
    @posts = Post.all
  end

  def new
    @user = User.find(session[:user_id])
    if @user.admin?
      @post = Post.new
    else
      redirect '/'
    end
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Thanks, your post has been added to the list!"
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
