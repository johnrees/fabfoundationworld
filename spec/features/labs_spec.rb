require 'spec_helper'

describe "Labs" do

  describe "listing" do

    it "should have list" do
      visit '/labs'
      page.should have_selector 'h1', 'Listing Labs'
    end

    it "should only list verified labs" do
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

  describe "showing" do

    it "should not be showable if unverified" do
      lab = FactoryGirl.create(:lab, name: 'NASA')
      expect{ visit lab_path(lab) }.to raise_error(CanCan::AccessDenied)
    end

    it "should be showable if verified" do
      lab = FactoryGirl.create(:lab, name: 'NASA')
      lab.verify!
      visit lab_path(lab.reload)
      page.should have_selector 'h1', 'NASA'
    end

  end

  describe "adding" do

    it "should be creatable" do
      visit new_lab_url

      fill_in 'Name', with: 'A lab'
      fill_in 'Address', with: "44 Some Road\nParis"
      fill_in 'Postal code', with: '23032'
      fill_in 'Latitude', with: '33.420'
      fill_in 'Longitude', with: '-1.303'

      # fill_in 'Opening Hours', with: 'Monday - Friday'
      fill_in 'Notes', with: 'laboris nisi ut aliquip ex ea commodo'
      # select 'France', from: 'Country'

      select 'Fab Lab', from: 'Kind'

      click_button 'Create'
      page.should have_selector 'h1', 'Thank you'
    end

  end

end
