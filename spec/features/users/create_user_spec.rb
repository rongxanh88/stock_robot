require 'rails_helper'

RSpec.feature "User", :type => :feature do
  scenario "User creates account" do
    visit ("/home")

    click_on "Sign Up"
    fill_in "user[email_address]", with: "bob@nomail.com"
    fill_in "user[password_digest]", with: "password"
    click_on "Create Account"

    expect(page).to have_content("User account creation successful!")
    expect(page).to have_content("Welcome bob@nomail.com!")
  end
end