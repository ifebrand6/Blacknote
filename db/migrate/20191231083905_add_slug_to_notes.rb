class AddSlugToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :slug, :string
    add_index :notes, :slug, unique: true
  end
end
