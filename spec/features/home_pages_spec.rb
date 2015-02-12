require 'rails_helper'

RSpec.feature "Home Page", type: :feature do
  before(:each) do
    visit '/'
  end

  it "has the right title" do
    expect(page).to have_title 'Skills Inventory | Home'
  end

  it "has the navigation" do
    expect(page).to have_selector 'nav'
  end
end
