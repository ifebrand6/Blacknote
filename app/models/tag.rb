class Tag < ApplicationRecord
    has_many :labels, class_name: "label", foreign_key: "reference_id"
    has_many :notes, through: :labels
end
