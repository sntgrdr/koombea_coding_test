# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :pages, only: %i[create show index]

  root 'home#index'
end
