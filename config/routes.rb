# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create update destroy]
  resources :music_records, only: %i[index create update destroy]
  resources :rentals, only: %i[create update destroy]
  resources :orders, only: %i[create destroy]
end
