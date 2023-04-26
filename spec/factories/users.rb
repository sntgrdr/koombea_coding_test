# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email        { Faker::Internet.unique.email }
    password     { Faker::Internet.password(min_length: 8) }

    trait :with_pages do
      transient do
        user { create(:user) }
      end

      pages { create_list(:page, 3, user:) }
    end
  end
end
