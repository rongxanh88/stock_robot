require 'rails_helper'

RSpec.feature "Security", :type => :feature do
  scenario "User sees all security types" do
    user = create(:user)
    security1 = create(:security)
    security2 = create(:security, security_type: "ETF")

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    visit (securities_path)
    
    expect(page).to have_content(security1.security_type)
    expect(page).to have_content(security2.security_type)
  end
end