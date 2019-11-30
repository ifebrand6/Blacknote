# frozen_string_literal: true

class Note < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :tags, class_name: "tag", foreign_key: "reference_id"
    validates :content, length: { minimum: 200}
end
