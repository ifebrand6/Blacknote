# frozen_string_literal: true

class RemoveNoteRefToCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :note, foreign_key: true
  end
end
