class OpeningTime < ActiveRecord::Base
  belongs_to :lab

  validates :lab, :start_minute, :end_minute, presence: true

  default_scope { order('opening_times.start_minute') }

  scope :right_now, -> {
    t = Time.now
    where(
      "start_minute <= :min AND end_minute >= :min",
      { min: t.minute_of_the_week }
    )
  }

end
