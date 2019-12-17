class AddColumnsToNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :latitude, :float
    add_column :notes, :longitude, :float
  end
end
