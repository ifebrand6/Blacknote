# frozen_string_literal: true

class AddIndexToCategories < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :name
  end
end
