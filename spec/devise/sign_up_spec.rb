# frozen_string_literal: true

require 'rails_helper'

describe 'the signun process', type: :feature do
  let!(:user) { build(:user) }

  it 'Signs up the user' do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome to ScraperApp'
    expect(User.count).to eq(1)
    expect(User.last.email).to eq(user.email)
  end
end
