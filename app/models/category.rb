class Category < ApplicationRecord
    has_many :notes, class_name: "note", foreign_key: "reference_id"
end
