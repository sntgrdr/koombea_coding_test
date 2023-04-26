# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :page, only: :show
  before_action :pages, only: :index

  def new
    @page = Page.new
  end

  def create
    ScrapingJob.perform_async(params[:url], current_user)
    render :ok
  end

  def index
    @pages = current_user.pages.newest_first
  end

  def show
    page
  end

  private

  def page
    @page = Page.find_by(id: params[:id])
  end
end
