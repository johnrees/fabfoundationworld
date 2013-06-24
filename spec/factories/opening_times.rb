# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :opening_time do
    lab
    day_of_the_week { Time.now.wday }
    minute { Time.now.minute_of_the_day - 1 }
    duration 5 # minutes
  end
end
