# frozen_string_literal: true

class AddColumnToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :address, :string
  end
end
