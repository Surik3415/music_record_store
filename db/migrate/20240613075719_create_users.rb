# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 120, null: false
      t.string :last_name, limit: 120, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.integer :role, default: 0, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :phone_number, unique: true
  end
end
