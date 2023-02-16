# frozen_string_literal: true

class MainController < ApplicationController
  before_action :set_page_options

  def index
    @works = Work.all.limit(3).order created_at: :desc
    @blogs = Blog.order(created_at: :desc).page params[:page]
  end

  def set_page_options
    @page_title = t('set_page_options.page_title')
    @page_description = t('set_page_options.page_description')
    @page_keywords = t('set_page_options.page_keywords')
  end
end
