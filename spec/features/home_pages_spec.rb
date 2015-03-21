require 'rails_helper'

RSpec.feature "Home Page", type: :feature do

  # include Features::SessionsHelper

  let(:user) { create(:user, admin: true) }

  before(:each) do
    visit login_path
    fill_in 'Email Address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit '/'
  end

  it "has the right title" do
    expect(page).to have_title 'Skills Inventory | Home'
  end

  it "has the navigation" do
    expect(page).to have_selector 'nav'
  end
end
