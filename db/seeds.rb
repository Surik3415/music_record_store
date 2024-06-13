# # frozen_string_literal: true

# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end


Order.delete_all
Rental.delete_all
MusicRecord.delete_all
User.delete_all

5.times do
  MusicRecord.create!(
    # id: SecureRandom.uuid,
    title: FFaker::Music.song,
    photo: FFaker::Image.url,
    price: rand(1..100),
    description: FFaker::Lorem.phrase,
    damage_assessment: FFaker::Lorem.phrase
  )
end

# Create admin user
User.create!(
  # id: SecureRandom.uuid,
  first_name: 'Admin',
  last_name: 'User',
  phone_number: FFaker::PhoneNumber.imei,
  email: 'admin@example.com',
  role: 0
)

# Create manager user
User.create!(
  # id: SecureRandom.uuid,
  first_name: 'Manager',
  last_name: 'User',
  phone_number: FFaker::PhoneNumber.phone_number,
  email: 'manager@example.com',
  role: 1
)

# Create basic users with orders and rentals
3.times do
  basic_user = User.create!(
    # id: SecureRandom.uuid,
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    phone_number: FFaker::PhoneNumber.phone_number,
    email: FFaker::Internet.email,
    role: 2
  )

  # Create orders for basic user
  2.times do
    Order.create!(
      # id: SecureRandom.uuid,
      user: basic_user,
      music_record: MusicRecord.order('RANDOM()').first,
      ordered_at: FFaker::Time.between(1.year.ago, Time.now)
    )
  end

  # Create rentals for basic user
  3.times do
    Rental.create!(
      # id: SecureRandom.uuid,
      user: basic_user,
      music_record: MusicRecord.order('RANDOM()').first,
      rented_at: FFaker::Time.between(1.year.ago, Time.now).to_date,
      returned_at: FFaker::Time.between(1.year.ago, Time.now).to_date + 3.months,
      damage_assessment: FFaker::Lorem.phrase,
      price: rand(10..50),
      note: FFaker::Lorem.phrase
    )
  end
end
