require 'spec_helper'

describe Lab do

  let(:lab) { Lab.create(name: 'Space Lab',
    country_code: 'FR',
    address: 'somewhere',
    postal_code: '13113') }

  describe "attributes" do

    %w(name address postal_code).each do |field|
      it { should validate_presence_of field }
    end

    describe "states" do

      it "should have initial state" do
        lab.should be_unverified
      end

      it "should be verifiable" do
        lab.verify!
        lab.reload.previous_version.should be_unverified
        lab.should be_verified
      end

    end

    describe "slugs" do

      it "should have slug" do
        lab.slug.should eq('space-lab')
      end

      it "should avoid duplicate slugs" do
        pending "need to sort country codes"
        lab1 = Lab.create(name: 'Space Lab', country_code: 'FR')
        lab2 = Lab.create(name: 'Space Lab', country_code: 'ES')
        lab2.slug.should eq('space-lab-spain')
      end

    end

  end

end
