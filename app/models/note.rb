# frozen_string_literal: true

class Note < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :content, length: { minimum: 200}
end
