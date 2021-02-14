class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def ranking
    @posts = Post.all.order(likes: :desc).page(params[:page])
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
