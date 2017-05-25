require 'rails_helper'

RSpec.feature "User", :type => :feature do
  scenario "logs out successfully" do
    user = create(:user)
    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    expect(page).to have_current_path(tickers_path)

    click_on "Log Out"
    expect(page).to have_current_path("/home")
    expect(page).to have_content("Successfully logged out.")
  end
end