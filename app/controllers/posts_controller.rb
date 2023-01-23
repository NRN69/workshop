class PostsController < ApplicationController

  before_action :set_post!, only: %i[show destroy edit update]

  def index
    @posts = Post.order created_at: :desc
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      respond_to do |format|
        format.turbo_stream { flash.now[:success] = 'Post create!' }
      end
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update post_params
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.turbo_stream { flash.now[:success] = 'Post deleted!' }
    end
  end

  private

  def set_post!
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :body, :img)
  end

end