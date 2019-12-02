# frozen_string_literal: true

class Note < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :labels
    has_many :tags, through: :labels
    validates :content, length: { minimum: 200}
    # sort the note to most recent
    scope :recent, lambda { order(created_at: :desc)}
end
