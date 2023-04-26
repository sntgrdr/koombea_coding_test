# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class ScrapingJob < ApplicationJob
  queue_as :default

  def perform(html, user)
    doc = Nokogiri::HTML(html)
    Page.create!(create_payload(user.id, doc))
  rescue StandardError => e
    Rails.logger.error("ScrapingJob failed with error: #{e.message}")
    raise e
  end

  private

  def create_payload(user_id, doc)
    links = doc.css('a').map { |link| { href: link.attr('href'), text: link.text } }
    { name: doc.title, links: links.as_json, user_id: }
  end
end
