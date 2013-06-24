class OpeningTime < ActiveRecord::Base
  belongs_to :lab

  validates :lab, :day_of_the_week, :minute, :duration, presence: true

  default_scope { order('opening_times.day_of_the_week, opening_times.minute') }

  scope :right_now, -> {
    t = Time.now
    where(
      "day_of_the_week = :day AND minute <= :min AND (minute + duration) >= :min",
      { day: t.wday, min: t.minute_of_the_day }
    )
  }

end
