class OpeningTime < ActiveRecord::Base
  belongs_to :lab

  validates :lab, :day_of_the_week, :minute, :duration, presence: true
end
