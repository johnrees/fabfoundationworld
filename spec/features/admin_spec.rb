require 'spec_helper'

describe "Admin Area" do

  describe "visit admin" do

    before(:each) do
      visit '/admin'
    end

    it "render success" do
      page.should have_selector 'h1', text: 'Manage Labs'
    end

  end

  describe "edit lab" do

    it "has machines" do
      lab = FactoryGirl.create(:lab, name: 'iaac')
      machine = FactoryGirl.create(:machine, name: 'laser')
      visit edit_admin_lab_path(lab)
      page.should have_content 'laser'
    end

    it "can edit" do
      pending "admin user for cancan"
      FactoryGirl.create(:lab, name: 'iaac')
      visit admin_root_path
      click_link 'iaac'
      fill_in 'Name', with: 'valldaura'
      click_button 'Update'
      page.should have_selector '#notice', 'Lab was successfully updated.'
    end

    it "has map" do
      lab = FactoryGirl.create(:lab, name: 'iaac')
      visit edit_admin_lab_path(lab)
      page.should have_selector '#map'
    end

  end

end
