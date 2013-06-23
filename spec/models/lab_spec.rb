require 'spec_helper'

describe Lab do

  let(:lab) { Lab.create(name: 'Space Lab',
    country_code: 'FR',
    address: 'somewhere',
    postal_code: '13113',
    kind: 0) }

  describe "attributes" do

    describe "kinds" do

      pending { should have_and_belong_to_many :facilities }

      it { should have_many(:opening_times) }
      it { should validate_presence_of(:kind) }
      it { should validate_presence_of(:country_code) }

      it "should have kinds_for_select" do
        Lab.kinds_for_select.should eq(
          [
            ['Fab Lab', 0],
            ['Mini Fab Lab', 1],
            ['Planned Fab Lab', 2]
          ])
      end

    end

    %w(name address postal_code).each do |field|
      it { should validate_presence_of field.to_sym }
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
        lab1 = FactoryGirl.create(:lab, name: 'Space Lab', country_code: 'fr')
        lab2 = FactoryGirl.create(:lab, name: 'Space Lab', country_code: 'es')
        lab2.slug.should eq('space-lab-spain')
      end

    end

  end

end
