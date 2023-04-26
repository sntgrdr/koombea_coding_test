# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby '3.1.1'

* Rails version
  rails '7.0.4'

* System dependencies
  Run Sidekiq in another terminal tab within your repository
  And also redis-server in another tab (It's not necessary to be in the repository directory)

* Configuration
  1 - Clone the repository
  2 - Check if you have both Ruby and Rails versions installed
  3 - Create and migrate the database
  4 - run the server with 'rails s'
  5 - Register at '/users/sign_up'
  6 - Submit the form entering an url to scrap
  7 - See how many links it has
  8 - Access to an specific WebPage to see each link

* Database creation
  rails db:create

* Database initialization
  rails db:migrate

* How to run the test suite
  You may want to run

* Services (job queues, cache servers, search engines, etc.)

* Gems installed
  - Rubocop
  - Devise
  - RSpec
  - FactoryBot
  - Faker
  - Shoulda Matchers
  - simplecov
  - Sidekiq
  - Rails Controller Testing
  - Turbo Rails
