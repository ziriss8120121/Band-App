class BandMembership < ApplicationRecord
  belongs_to :band
  belongs_to :user
  validates :instrument, presence: true
end
