# frozen_string_literal: true

class Category < ApplicationRecord
  acts_as_paranoid
  has_many :notes, dependent: :destroy
end
