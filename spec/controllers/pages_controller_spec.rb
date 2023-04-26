# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  include Devise::Test::ControllerHelpers
  include Rails::Controller::Testing::TestProcess
  include Rails::Controller::Testing::TemplateAssertions
  include Rails::Controller::Testing::Integration

  let(:current_user) { create(:user) }

  before do
    sign_in current_user
  end

  describe '#create' do
    subject { post :create, params: { url: 'https://news.ycombinator.com/' } }

    context 'when the job is enqueued successfully' do
      it 'enqueues a scraping job and redirects to the index page' do
        expect { subject }.to have_enqueued_job(ScrapingJob)
        expect(response).to redirect_to(pages_path)
      end
    end

    context 'when the job fails to enqueue' do
      it 'renders the new page and sets a flash error if there is an error processing the page' do
        allow(ScrapingJob).to receive(:perform_later).and_raise('Oops!')
        subject
        expect(response).to render_template(:index)
        expect(flash[:error]).to eq('There was an error processing the page: Oops!')
      end
    end
  end

  describe '#index' do
    it 'returns a success response and assigns @pages' do
      page1 = create(:page, user: current_user)
      page2 = create(:page, user: current_user)
      get :index
      expect(response).to be_successful
      expect(assigns(:pages)).to eq([page2, page1])
    end
  end

  describe '#show' do
    it 'returns a success response and assigns @page' do
      page = create(:page, user: current_user)
      get :show, params: { id: page.id }
      expect(response).to be_successful
      expect(assigns(:page)).to eq(page)
    end
  end
end
