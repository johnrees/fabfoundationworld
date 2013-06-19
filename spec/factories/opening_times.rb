# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :opening_time do
    lab
    day_of_the_week 1
    minute 9 * 60
    duration 8.hours
  end
end
