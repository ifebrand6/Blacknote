# frozen_string_literal: true

class AddIndexToTag < ActiveRecord::Migration[5.2]
  def change
    add_index :tags, :keyword
  end
end
