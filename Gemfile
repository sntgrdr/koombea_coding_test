# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'bootsnap', require: false
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '~> 5.0'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1', '>= 3.1.1'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'webdrivers'
end
