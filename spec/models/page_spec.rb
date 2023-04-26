# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  describe '#associations' do
    it { should belong_to(:user) }
  end

  describe '#validatios' do
    subject { build(:page) }

    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
