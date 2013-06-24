require 'spec_helper'

describe OpeningTime do
  it { should belong_to(:lab) }

  %w(lab day_of_the_week minute duration).each do |field|
    it { should validate_presence_of field }
  end

  describe "right now scope" do

    it "should include 'open' openingtimes" do
      Timecop.freeze do
        open = FactoryGirl.create(:opening_time)
        OpeningTime.right_now.should include open
      end
    end

    it "should exclude 'closed' openingtimes" do
      Timecop.freeze do
        closed = FactoryGirl.create(:opening_time, minute: 0, duration: 10)
        OpeningTime.right_now.should_not include closed
      end
    end

  end

end
