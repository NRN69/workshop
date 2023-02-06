# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post!, only: %i[show destroy edit update]

  def index
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      respond_to do |format|
        format.html do
          flash[:success] = t('posts.create.success')
          redirect_to posts_path
        end
      end
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update post_params
      respond_to do |format|
        format.html do
          flash[:success] = t('posts.create.success')
          redirect_to posts_path
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html do
        flash[:success] = t('posts.destroy.success')
        redirect_to posts_path, status: :see_other
      end

      format.turbo_stream { flash.now[:success] = t('posts.destroy.success') }
      redirect_to posts_path
    end
  end

  private

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  def set_post!
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :body, :img)
  end
end
