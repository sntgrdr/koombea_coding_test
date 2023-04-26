# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :user

  scope :newest_first, -> { order(created_at: :desc) }

  serialize :links, JSON
end
