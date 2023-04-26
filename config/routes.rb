# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: %i[new create show index]

  root 'home#index'
end
