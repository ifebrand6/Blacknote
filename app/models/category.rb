class Category < ApplicationRecord
    has_many :notes, class_name: "note", dependent: :destroy
end
