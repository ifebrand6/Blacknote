class Label < ApplicationRecord
  belongs_to :note
  belongs_to :tag
end
