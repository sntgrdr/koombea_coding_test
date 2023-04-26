# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :page, only: :show

  def new
    @page = Page.new
  end

  def create
    ScrapingJob.perform_later(URI.parse(params[:url]).open.read, current_user)
    redirect_to pages_path, notice: 'The page is being processed. Results will be available soon.'
  rescue StandardError => e
    flash[:error] = "There was an error processing the page: #{e.message}"
    render :new
  end

  def index
    @pages = current_user.pages.newest_first
  end

  def show
    @page
  end

  private

  def page
    @page = Page.find_by(id: params[:id])
  end
end
