# frozen_string_literal: true

class MusicRecord < ApplicationRecord
  has_many :orders
  has_many :rentals

  validates :title, presence: true, length: { maximum: 120, message: 'must be at most 120 characters long' }
  validates :price, presence: true, numericality: { greater_than: 0, message: 'must be a positive number' }
  validates :description, length: { maximum: 120, message: 'must be at most 120 characters long' }
end
