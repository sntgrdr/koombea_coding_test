# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#associations' do
    it { should have_many(:pages).dependent(:destroy) }

    it "destroy all users's pages" do
      user = build(:user, :with_pages)
      user_pages = user.pages.size
      expect { user.destroy! }.to change(Page, :count).from(user_pages).to(0)
    end
  end

  describe '#validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8).is_at_most(128) }

    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe '#devise_modules' do
    it { should have_db_column(:email).of_type(:string).with_options(null: false) }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_index(:email).unique }
    it { should have_db_index(:reset_password_token).unique }
  end
end
