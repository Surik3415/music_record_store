# frozen_string_literal: true

class CreateRentals < ActiveRecord::Migration[7.1]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :music_record, null: false, foreign_key: true
      t.date :rented_at
      t.date :returned_at
      t.text :damage_assessment
      t.integer :price
      t.text :note

      t.timestamps
    end

    add_index :rentals, :rented_at
  end
end
