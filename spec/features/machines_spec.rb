require 'spec_helper'

describe "Machines" do

  let(:machine) { FactoryGirl.create(:machine, name: 'Machine A') }

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

  it "can edit machine" do
    visit edit_admin_machine_path(machine)
    fill_in "Name", with: "New Name"
    click_button "Update"
    expect(page).to have_selector '#notice', text: "Machine was successfully updated."
    expect(page).to have_link "New Name"
  end

  it "lists machines" do
    FactoryGirl.create(:machine, name: 'Machine A')
    visit admin_machines_path
    expect(page).to have_link "Machine A"
  end

end
