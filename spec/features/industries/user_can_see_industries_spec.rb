require 'rails_helper'

RSpec.feature "Industry", :type => :feature do
  scenario "User sees all industries" do
    user = create(:user)
    visit ("/home")
    create_list(:industry, 5)

    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    industry = Industry.first
    industry2 = Industry.last
    visit (industries_path)
    
    expect(page).to have_content(industry.name)
    expect(page).to have_content(industry2.name)
  end
end