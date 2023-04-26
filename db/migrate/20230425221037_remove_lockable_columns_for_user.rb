# frozen_string_literal: true

class RemoveLockableColumnsForUser < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :failed_attempts
    remove_column :users, :unlock_token
    remove_column :users, :locked_at
  end

  def down
    add_column :users, :failed_attempts, :integer, default: 0, null: false
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
  end
end
