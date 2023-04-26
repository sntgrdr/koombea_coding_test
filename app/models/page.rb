# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: true

  scope :newest_first, -> { order(created_at: :desc) }

  serialize :links, JSON

  after_create_commit :broadcast_new_message

  private

  def broadcast_new_message
    broadcast_replace_to :pages, target: :pages_list, partial: 'pages/table_body',
                                 locals: { pages: user.pages.newest_first }
  end
end
