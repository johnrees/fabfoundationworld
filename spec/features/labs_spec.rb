require 'spec_helper'

describe "Labs" do

  describe "adding" do

    it "should be creatable" do
      visit new_lab_url

      fill_in 'Name', with: 'A lab'
      fill_in 'Address', with: "44 Some Road\nParis"
      fill_in 'Postal code', with: '23032'
      # select 'France', from: 'Country'

      click_button 'Create'
      page.should have_selector '#notice', 'Lab was successfully created.'
    end

  end

end
