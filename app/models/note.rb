# frozen_string_literal: true

require 'csv'

class Note < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  acts_as_paranoid
  belongs_to :user
  belongs_to :category, -> { with_deleted }, class_name: 'Category'
  has_many :labels, class_name: 'Label'
  has_many :tags, through: :labels, dependent: :destroy
  validates :content, length: { minimum: 200 }
  scope :recent, -> { order(created_at: :desc) }
  scope :most_recent, -> { order(title: DESC) }
  self.per_page = 5

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  
  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end

  after_create do
    note = Note.find_by(id: id)
    hashtags = content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(keyword: hashtag.downcase.delete('#'))
      note.tags << tag
    end
  end
  before_update do
    note = Note.find_by(id: id)
    note.tags.clear
    hashtags = content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(keyword: hashtag.downcase.delete('#'))
      note.tags << tag
    end
  end
  def set_user!(user)
    self.user_id = user.id
    save
  end

  def self.all_with_category_details
    Note.select('notes.*, categories.name as category_name, categories.id as category_id').joins(:category)
  end

  def self.as_csv
    CSV.generate do |csv|
      columns = %w[id title content]
      csv << columns.map(&:humanize)
      all_with_category_details.each do |note|
        csv << note.attributes.values_at(*columns)
      end
    end
  end

  # added method for search
  def self.search(search)
    where('lower(categories.name) LIKE :search OR lower(notes.content) LIKE :search OR lower(notes.title) LIKE :search', search: "%#{search.downcase}%").uniq
  end

end
