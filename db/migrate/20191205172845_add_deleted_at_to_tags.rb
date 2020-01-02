# frozen_string_literal: true

class AddDeletedAtToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :deleted_at, :datetime
    add_index :tags, :deleted_at
  end
end
