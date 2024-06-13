# frozen_string_literal: true

class CreateMusicRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :music_records do |t|
      t.string :title, limit: 120, null: false
      t.string :photo
      t.integer :price, null: false
      t.text :description
      t.text :damage_assessment, limit: 120

      t.timestamps
    end

    add_index :music_records, :title, unique: true
  end
end
