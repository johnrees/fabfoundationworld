require 'spec_helper'

describe Lab do

  let(:lab) { Lab.create(name: 'Space Lab', country: 'France') }

  describe "attributes" do

    it { should validate_presence_of :name }

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
        lab1 = Lab.create(name: 'Space Lab', country: 'France')
        lab2 = Lab.create(name: 'Space Lab', country: 'Spain')
        lab2.slug.should eq('space-lab-spain')
      end

    end

  end

end
