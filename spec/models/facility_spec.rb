require 'spec_helper'

describe Facility do
  it { should validate_presence_of :type }
  it { should validate_presence_of :name }
end
