# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class ScrapingJob
  def perform(url, user)
    doc = Nokogiri::HTML(URI.parse(url).open.read)
    Page.create!(create_payload(user.id, doc))
  end

  private

  def create_payload(user_id, doc)
    links = doc.css('a').map { |link| { href: link.attr('href'), text: link.text } }
    { title: doc.title, links: links.as_json, user_id: }
  end
end
