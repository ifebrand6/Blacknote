class Tag < ApplicationRecord
    belongs_to :note, class_name: "note", foreign_key: "note_id"
end
