# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[create update destroy]
  resources :music_records, only: %i[index show create update]
  resources :rentals, only: %i[index show create update destroy]
  resources :orders, only: %i[index show create destroy]
end
