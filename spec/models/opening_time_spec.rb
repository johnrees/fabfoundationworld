require 'spec_helper'

describe OpeningTime do
  it { should belong_to(:lab) }

  %w(lab start_minute end_minute).each do |field|
    pending { should validate_presence_of field }
  end

  it "has default_scope" do
    latest = FactoryGirl.create(:opening_time, start_minute: 800)
    earliest = FactoryGirl.create(:opening_time, start_minute: 1, end_minute: 20)
    middle = FactoryGirl.create(:opening_time, start_minute: 300)
    OpeningTime.all.should eq [earliest,middle,latest]
  end

  describe "right now scope" do

    it "includes 'open' openingtimes" do
      Timecop.freeze do
        open = FactoryGirl.create(:opening_time)
        OpeningTime.right_now.should include open
      end
    end

    it "excludes 'closed' openingtimes" do
      Timecop.freeze do
        closed = FactoryGirl.create(:opening_time, start_minute: 0, end_minute: 1)
        OpeningTime.right_now.should_not include closed
      end
    end

  end

end
