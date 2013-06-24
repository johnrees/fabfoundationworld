require 'spec_helper'

describe "Labs" do

  describe "listing" do

    it "should have add a lab button" do
      visit '/labs'
      click_link "Add a Lab"
      page.should have_selector 'h1', 'New lab'
    end

    it "should have list" do
      visit '/labs'
      page.should have_selector 'h1', 'Listing Labs'
    end

    pending "should only list verified labs" do
      unverified = FactoryGirl.create(:lab, name: 'unverified')
      verified = FactoryGirl.create(:lab, name: 'verified')
      verified.verify!
      visit labs_path
      page.should have_link 'verified'
      page.should_not have_link 'unverified'
    end

    it "should be clickable" do
      lab = FactoryGirl.create(:lab, name: 'NASA')
      lab.verify!
      visit '/labs'
      click_link 'NASA'
      page.should have_selector 'h1', 'NASA'
    end

  end

  describe "map" do

    it "should have map" do
      visit "/map"
      page.should have_selector '#map'
    end

  end

  describe "showing" do

    let(:lab) { FactoryGirl.create(:lab, name: 'NASA') }

    describe "opening times" do

      pending "it should support timezones"

      pending "should show today's opening times" do
      end

      it "should show if open" do
        lab.opening_times << FactoryGirl.create(:opening_time)
        lab.verify!
        visit lab_path(lab)
        page.should have_content 'Open'
        # make this javascript
      end

      it "should show if closed" do
        lab.verify!
        visit lab_path(lab)
        page.should have_content 'Closed'
        # make this javascript
      end

    end

    pending "should not be showable if unverified" do
      expect{ visit lab_path(lab) }.to raise_error(CanCan::AccessDenied)
    end

    it "should be showable if verified" do
      lab.verify!
      visit lab_path(lab.reload)
      page.should have_selector 'h1', 'NASA'
    end

    %w(name address postal_code phone_number).each do |name|
      it "should show #{name}" do
        lab.verify!
        visit lab_path(lab.reload)
        page.should have_content lab[name]
      end
    end

  end

  # describe "opening hours" do

  #   it "should have opening hours on form" do

  #   end

  # end

  describe "adding" do

    it "should be creatable" do
      visit new_lab_url

      fill_in 'Name', with: 'A lab'
      fill_in 'Address', with: "44 Some Road\nParis"
      fill_in 'Postal code', with: '23032'
      fill_in 'Phone number', with: '20982442'
      # fill_in 'Email address', with: 'test@test.com'
      # fill_in 'Latitude', with: '33.420'
      # fill_in 'Longitude', with: '-1.303'

      # fill_in 'Opening Hours', with: 'Monday - Friday'
      fill_in 'Notes', with: 'laboris nisi ut aliquip ex ea commodo'
      select 'France', from: 'Country'

      select 'Fab Lab', from: 'Kind'

      click_button 'Create'
      page.should have_selector 'h1', text: 'Thank you'
    end

  end

end
