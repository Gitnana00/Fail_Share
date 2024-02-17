# frozen_string_literal: true

class AddPrivateToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :private, :boolean
  end
end
