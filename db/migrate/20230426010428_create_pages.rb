# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :name, null: false
      t.text :links
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
