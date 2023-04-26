# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :pages, only: %i[create show index]

  root 'home#index'
end
