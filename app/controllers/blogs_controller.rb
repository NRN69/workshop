# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :set_blog!, only: %i[show destroy edit update]

  def index
    @blogs = Blog.order(created_at: :desc).page params[:page]
  end

  def new
    @blog = current_user.blogs.build
  end

  def create
    @blog = current_user.blogs.build blog_params
    if @blog.save
      respond_to do |format|
        format.html do
          flash[:success] = t('blogs.create.success')
          redirect_to blogs_path
        end
      end
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @blog.update blog_params
      respond_to do |format|
        format.html do
          flash[:success] = t('blogs.create.success')
          redirect_to blogs_path
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html do
        flash[:success] = t('blogs.destroy.success')
        redirect_to blogs_path, status: :see_other
      end

      format.turbo_stream { flash.now[:success] = t('blogs.destroy.success') }
      redirect_to blogs_path
    end
  end

  private

  def set_blog!
    @blog = Blog.find params[:id]
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :img, :user_id, :file)
  end
end
