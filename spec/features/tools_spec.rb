require 'spec_helper'

describe "Tools" do

  let(:tool) { FactoryGirl.create(:tool, name: 'Tool A') }

  it "has index" do
    visit admin_tools_path
    expect(page).to have_selector 'h1', text: "Tools"
  end

  it "can add tool" do
    visit admin_root_path
    click_link "Tools"
    click_link "Add Tool"
    fill_in "Name", with: "Tool Name"
    click_button "Create"
    expect(page).to have_selector '#notice', text: "Tool was successfully created."
    expect(page).to have_link "Tool Name"
  end

  it "can edit tool" do
    visit edit_admin_tool_path(tool)
    fill_in "Name", with: "New Name"
    click_button "Update"
    expect(page).to have_selector '#notice', text: "Tool was successfully updated."
    expect(page).to have_link "New Name"
  end

  it "lists tools" do
    FactoryGirl.create(:tool, name: 'Tool A')
    visit admin_tools_path
    expect(page).to have_link "Tool A"
  end

end
