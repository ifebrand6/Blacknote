class Category < ApplicationRecord
    has_many :notes, dependent: :destroy
end
