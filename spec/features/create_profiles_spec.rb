require 'rails_helper'

RSpec.feature "Creating Profiles", type: :feature do
  it "upon initial registration" do
    user = build(:user)
    visit "/register"
    fill_in "First Name", :with => user.first_name
    fill_in "Last Name", :with => user.last_name
    fill_in "Email Address", :with => user.email
    fill_in "Password", :with => user.password
    fill_in "Confirm password", :with => user.password
    click_button "Save"

    expect(page).to have_content 'Profile'
  end
end
