# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :opening_time do
    lab
    start_minute { Time.now.minute_of_the_week - 1 }
    end_minute {
      # need to account for monday after sunday
      Time.now.minute_of_the_week + 5
    }
  end
end
