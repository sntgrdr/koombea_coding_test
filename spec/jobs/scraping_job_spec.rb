# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScrapingJob, type: :job do
  describe '#perform' do
    let(:user) { create(:user) }
    let(:html) { File.read(Rails.root.join('spec/fixtures/example.html')) }

    subject { described_class.perform_now(html, user) }

    context 'when it has valid parameters' do
      it 'scrapes the page and creates a new Page object' do
        expect { subject }.to change(Page, :count).by(1)

        page = Page.last
        expect(page.name).to eq('Hacker News')
        expect(page.links.size).to eq(226)
        expect(page.links[0]).to eq({ 'href' => 'https://news.ycombinator.com', 'text' => '' })
        expect(page.user).to eq(user)
      end
    end

    context 'when it has invalid parameters' do
      let(:html)  { 'not a valid url' }

      it 'logs the error message when an exception is raised' do
        allow_any_instance_of(Nokogiri::HTML::Document).to receive(:css).and_raise(StandardError,
                                                                                   'Something went wrong')
        expect { described_class.perform_now(html, user) }.to raise_error(StandardError, 'Something went wrong')
      end
    end
  end
end
