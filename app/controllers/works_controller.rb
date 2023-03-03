# frozen_string_literal: true

class WorksController < ApplicationController
  before_action :set_work!, only: %i[show destroy edit update]

  def index
    @works = Work.all.limit(3).order created_at: :desc
  end

  def new
    @work = current_user.works.build
  end

  def create
    @work = current_user.works.build work_params
    if @work.save
      respond_to do |format|
        format.html do
          flash[:success] = t('works.create.success')
          redirect_to works_path
        end
      end
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @work.update work_params
      respond_to do |format|
        format.html do
          flash[:success] = t('works.create.success')
          redirect_to works_path
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @work.destroy
    respond_to do |format|
      format.html do
        flash[:success] = t('works.destroy.success')
        redirect_to works_path, status: :see_other
      end

      format.turbo_stream { flash.now[:success] = t('works.destroy.success') }
      redirect_to works_path
    end
  end

  private

  def set_work!
    @work = Work.find params[:id]
  end

  def work_params
    params.require(:work).permit(:title, :body, :img, :user_id, :file)
  end
end
