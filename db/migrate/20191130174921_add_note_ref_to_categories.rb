class AddNoteRefToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :note, foreign_key: true
  end
end
