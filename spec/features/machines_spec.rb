require 'spec_helper'

describe "Machines" do
  it "has index" do
    visit admin_machines_path
    page.should have_selector 'h1', text: "Machines"
  end
end
