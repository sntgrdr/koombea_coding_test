# frozen_string_literal: true

require 'rails_helper'

describe 'the signin process', type: :feature do
  let!(:user) { create(:user) }
  let(:other_user) { User.create(email: 'other@example.com', password: 'rous') }

  scenario 'Signing in with correct credentials' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Welcome to ScraperApp'
  end

  scenario 'Signing in with bad credentials' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: other_user.password
    end
    click_button 'Log in'
    expect(page).to have_text('Invalid Email')
  end
end
