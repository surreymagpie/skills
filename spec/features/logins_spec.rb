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

    before(:each) { login @user }

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

    before(:each) { login(@user, password: "WrongPassword")}

    it "prevents the user accessing information" do
      expect(page).to have_title 'Log in'
      expect(page).to have_link('Log in')
    end

    it "displays an error message" do
      expect(page).to have_content "Invalid email or password"
    end

  end

  context "Logging out" do
    before do
      login @user
      visit root_path
      click_link 'Log out'
    end

    it "shows the log in link" do
      expect(page).to have_link 'Log in'
    end

    it "shows a logged out message" do
      within '.flash' do
        expect(page).to have_content "Logged out"
      end
    end
  end
end

def login(user, options={})
  email     = options[:email] || user.email
  password  = options[:password] || user.password
  visit login_path
  fill_in 'Email Address', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end
