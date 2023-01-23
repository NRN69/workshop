class WorksController < ApplicationController

  before_action :set_work!, only: %i[show destroy edit update]

  def index
    @works = Work.all.limit(3).order created_at: :desc
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new work_params
    if @work.save
      respond_to do |format|
        format.turbo_stream { flash.now[:success] = 'Work create!' }
      end
      redirect_to works_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @work.update work_params
      redirect_to works_path
    else
      render :edit
    end
  end

  def destroy
    @work.destroy
    respond_to do |format|
      format.turbo_stream { flash.now[:success] = 'Work destroy!' }
    end
  end

  private

  def set_work!
    @work = Work.find params[:id]
  end

  def work_params
    params.require(:work).permit(:title, :body, :img)
  end

end
