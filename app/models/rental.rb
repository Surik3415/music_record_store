# frozen_string_literal: true

class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :music_record


  validates :rented_at, presence: true
  validates :damage_assessment, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :note, length: { maximum: 120 }
end
