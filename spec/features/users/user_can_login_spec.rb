require 'rails_helper'

RSpec.feature "User", :type => :feature do
  scenario "User logins successfully" do
    user = create(:user)
    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    expect(page).to have_content("Welcome to Stock Robot #{user.email_address}!")
    expect(page).to have_current_path(tickers_path)
  end

  scenario "User logins with upcased email address" do
    user = create(:user)
    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address.upcase
    fill_in "user[password]", with: user.password
    click_on "Login"

    expect(page).to have_content("Welcome to Stock Robot #{user.email_address}!")
    expect(page).to have_current_path(tickers_path)
  end
  
  scenario "User logins unsuccessfully" do
    user = create(:user)
    visit ("/home")

    click_on "Login"
    fill_in "user[email_address]", with: "wrong_email.com"
    fill_in "user[password]", with: user.password
    click_on "Login"

    expect(page).to have_content("Login Failed!")
    expect(page).to have_current_path(login_path)
  end

  scenario "User attempts to access tickers without loggin in" do
    visit (tickers_path)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end