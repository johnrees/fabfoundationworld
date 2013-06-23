class OpeningTime < ActiveRecord::Base
  belongs_to :lab

  validates :lab, :day_of_the_week, :minute, :duration, presence: true


  scope :right_now, -> {
    t = Time.now
    where(
      "day_of_the_week = ? AND minute <= ? AND (minute + duration) >= ?",
      t.wday,
      (t.hour * 60) + t.min,
      (t.hour * 60) + t.min
    )
  }

end
