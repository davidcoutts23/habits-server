class ApplicationIntention < ApplicationRecord
  belongs_to :habit
  validates :behaviour, presence: true
  validates :time, presence: true
  validates :location, presence: true
end
