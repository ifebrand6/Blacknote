# frozen_string_literal: true

class RemoveTagRefToNotes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notes, :tag, foreign_key: true
  end
end
