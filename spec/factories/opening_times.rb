# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  t = Time.now
  factory :opening_time do
    lab
    day_of_the_week { t.wday }
    minute { (t.hour * 60) + t.min - 2.minutes }
    duration 4.minutes
  end
end
