class Call < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true

  validate :overlap
  validates :start, presence: true

  # Currently assumed that meetings are always 2 hours long
  DURATION = 2.hours

  private

  def overlap
    return unless start

    finish = start + DURATION
    two_hours_before_start = start - DURATION
    if !Call.where(coach: coach, start: two_hours_before_start..finish).where.not(id: id).empty?
      errors.add(:start, " overlaps another meeting")
    end
  end
end
