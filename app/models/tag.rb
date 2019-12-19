class Tag < ApplicationRecord
    acts_as_paranoid
    has_many :labels, :class_name => 'Label'
    has_many :notes, through: :labels, dependent: :destroy
end
