# frozen_string_literal: true

class Note < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :labels, :class_name => 'Label'
    has_many :tags, through: :labels
    validates :content, length: { minimum: 200}
    # sort the note to most recent
    scope :recent, lambda { order(created_at: :desc)}

    after_create do
        note = Note.find_by(id: self.id)
        hashtags = self.content.scan(/#\w+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(keyword: hashtag.downcase.delete('#'))
            note.tags << tag
      end
    end
    before_update do
        note = Note.find_by(id: self.id) 
        note.tags.clear
        hashtags = self.content.scan(/#\w+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(keyword: hashtag.downcase.delete('#'))
            note.tags << tag
        end
    end
end
