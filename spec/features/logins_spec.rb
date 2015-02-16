require 'rails_helper'

RSpec.feature "Login", type: :feature do
  include SessionsHelper

  before(:all) { @user = create(:user) }

  context "navigating to the login page" do
    it "displays the login form" do
      visit '/'
      click_link 'Log in'
      expect(page).to have_content 'Log In'
      expect(page).to have_selector 'form.form'
    end
  end

  context "with vaild credentials" do

    before(:each) do
      visit login_path
      fill_in 'Email Address', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it "allows the user to see their profile" do
      expect(page).to have_title @user.full_name
      expect(page).to have_content @user.full_name
    end

    it "removes the login link and replaces a logout link" do
      visit root_path
      expect(page).to have_link 'Log out'
      expect(page).to_not have_link 'Log in'
    end

  end

  context "with invalid credentials" do

    before(:each) do
      visit login_path
      fill_in 'Email Address', with: @user.email
      fill_in 'Password', with: "WrongPassword"
      click_button 'Log in'
    end

    it "prevents the user accessing information" do
      expect(page).to have_title 'Log in'
      expect(page).to have_link('Log in')
    end

    it "displays an error message" do
      expect(page).to have_content "Invalid email or password"
    end

  end
end
