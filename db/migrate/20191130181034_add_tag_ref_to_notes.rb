class AddTagRefToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :tag, foreign_key: true
  end
end
