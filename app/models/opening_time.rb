class OpeningTime < ActiveRecord::Base

  belongs_to :lab
  # before_save :check_if_closed

  # validates :lab, :start_minute, :end_minute, presence: true

  default_scope { order('opening_times.start_minute') }

  # def closed
  #   @closed #|| start_minute == nil and end_minute == nil
  # end

  # def closed=(value)
  #   @closed = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value)
  # end
  # # alias :closed? :closed

  scope :right_now, -> {
    t = Time.now
    where(
      "start_minute <= :min AND end_minute >= :min",
      { min: t.minute_of_the_week }
    )
  }

private

  # def check_if_closed
  #   if closed
  #     self.destroy
  #     # self.start_minute = nil
  #     # self.end_minute = nil
  #   end
  # end

end
