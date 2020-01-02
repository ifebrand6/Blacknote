# frozen_string_literal: true

class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.references :note, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
