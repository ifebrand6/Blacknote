# frozen_string_literal: true
require 'csv'

class Note < ApplicationRecord
    belongs_to :user
    belongs_to :category, :class_name => 'Category'
    has_many :labels, :class_name => 'Label'
    has_many :tags, through: :labels, dependent: :destroy
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
    def set_user!(user)
        self.user_id = user.id
    
        self.save!
    end
     #added a method to return Note:active record
    def self.all_with_category_details
        Note.select("notes.*, categories.name as category_name, categories.id as category_id").joins(:category)
    end
    def self.as_csv
        CSV.generate do |csv|
            columns = %w(id title content)
            csv << columns.map(&:humanize)
            all_with_category_details.each do |note|
            csv << note.attributes.values_at(*columns)
            end
        end
        end
end
