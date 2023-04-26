# frozen_string_literal: true

class AddIndexToPageName < ActiveRecord::Migration[7.0]
  def up
    add_index :pages, :name, unique: true
  end

  def down
    remove_index :pages, :name
  end
end
