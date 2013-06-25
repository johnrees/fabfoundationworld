require 'spec_helper'

describe Lab do

  let(:lab) { Lab.create(name: 'Space Lab',
    country_code: 'FR',
    address: 'somewhere',
    postal_code: '13113',
    kind: 0) }

  describe "attributes" do

    describe "country" do
      it "has country name" do
        lab.country.should eq('France')
      end
    end

    describe "kinds" do
      pending { should have_and_belong_to_many :facilities }
      it { should validate_presence_of(:kind) }
      it { should validate_presence_of(:country_code) }
      it "has kinds_for_select" do
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
      it "has initial state" do
        lab.should be_unverified
      end
      it "is verifiable" do
        lab.verify!
        lab.reload
        lab.previous_version.should be_unverified
        lab.should be_verified
      end
    end

    describe "slugs" do
      it "has slug" do
        lab.slug.should eq('space-lab')
      end
      it "avoids duplicate slugs" do
        lab1 = FactoryGirl.create(:lab, name: 'Space Lab', country_code: 'fr')
        lab2 = FactoryGirl.create(:lab, name: 'Space Lab', country_code: 'es')
        lab2.slug.should eq('space-lab-spain')
      end
    end

  end

  describe "open hours" do

    it { should have_many(:opening_times) }

    describe "open scope" do

      let!(:lab) {
        t = Time.now
        FactoryGirl.create(:lab,
          opening_times: [FactoryGirl.create(:opening_time)]
        )
      }

      it "finds open labs" do
        Lab.open.should include lab
      end

      it "does not find closed labs" do
        lab.reload
        Timecop.travel(2.hours)
        Lab.open.should_not include lab
      end

    end

  end

end
