require 'spec_helper'

describe "Labs" do

  describe "listing" do

    before(:each) { visit '/labs' }

    it "should have list" do
      page.should have_selector 'h1', 'Listing Labs'
    end

    it "should be clickable" do
      FactoryGirl.create(:lab, name: 'NASA')
      visit '/labs'
      click_link 'NASA'
      page.should have_selector 'h1', 'NASA'
    end

  end

  describe "showing" do

    it "should be showable" do
      lab = FactoryGirl.create(:lab, name: 'NASA')
      visit lab_path(lab)
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
      page.should have_selector '#notice', 'Lab was successfully created.'
    end

  end

end
