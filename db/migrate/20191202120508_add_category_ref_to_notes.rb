# frozen_string_literal: true

class AddCategoryRefToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :category, foreign_key: true
  end
end
