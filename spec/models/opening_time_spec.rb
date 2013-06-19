require 'spec_helper'

describe OpeningTime do
  it { should belong_to(:lab) }

  %w(lab day_of_the_week minute duration).each do |field|
    it { should validate_presence_of field }
  end

end
