# frozen_string_literal: true

class MainController < ApplicationController

  before_action :set_page_options

  def index
    @works = Work.all.limit(3).order created_at: :desc
    @posts = Post.order created_at: :desc
  end

  def set_page_options
    @page_title = 'Workshop'
    @page_description = 'Workshop Trucks Electronics'
    @page_keywords = 'Heater Tachograph Condition'
  end
end
