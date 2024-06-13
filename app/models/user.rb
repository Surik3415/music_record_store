# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders
  has_many :rentals

  enum role: { admin: 0, manager: 1, basic_user: 2 }

  validates :first_name, presence: true, length: { maximum: 120, message: 'must be 120 characters or less' },
                         format: { with: /\A[a-zA-Z]+\z/, message: 'should contain only letters' }
  validates :last_name, presence: true, length: { maximum: 120, message: 'must be 120 characters or less' },
                        format: { with: /\A[a-zA-Z]+\z/, message: 'should contain only letters' }
  validates :phone_number, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
