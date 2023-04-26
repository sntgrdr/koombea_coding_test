# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    name  { Faker::Internet.domain_name }
    links { [Faker::Internet.url, Faker::Internet.url] }
  end
end
