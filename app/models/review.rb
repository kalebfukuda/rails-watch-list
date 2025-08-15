class Review < ApplicationRecord
  belongs_to :list
  validates :rating, presence: true, numericality: { in: 0..5, min: 0, max: 5 }
end
