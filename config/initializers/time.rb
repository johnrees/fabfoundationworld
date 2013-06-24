class Time

  def self.minutes_in_a_day
    1440
  end

  def self.minutes_in_a_week
    10080
  end

  def minute_of_the_day
    # (hour * minutes in hour) + minutes
    (self.hour * 60) + self.min
  end

  def minute_of_the_week
    # (day * minutes in day) + minute_of_the_day
    (self.wday * 1440) + self.minute_of_the_day
    # _minute <= Time.minutes_in_a_week ? _minute : _minute - Time.minutes_in_a_week
  end

end
