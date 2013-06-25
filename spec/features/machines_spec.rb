require 'spec_helper'

describe "Machines" do
  it "has index" do
    visit admin_machines_path
    expect(page).to have_selector 'h1', text: "Machines"
  end

  it "can add machine" do
    visit admin_root_path
    click_link "Machines"
    click_link "Add Machine"
    fill_in "Name", with: "Machine Name"
    click_button "Create"
    expect(page).to have_selector '#notice', text: "Machine was successfully created."
    expect(page).to have_link "Machine Name"
  end

  it "lists machines" do
    FactoryGirl.create(:machine, name: 'Machine A')
    visit admin_machines_path
    expect(page).to have_link "Machine A"
  end

end
