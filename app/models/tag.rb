class Tag < ApplicationRecord
    has_many :labels, :class_name => 'Label'
    has_many :notes, through: :labels
end
