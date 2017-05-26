require 'rails_helper'

RSpec.feature "Sector", :type => :feature do
  scenario "User sees all sectors" do
    user = create(:user)
    visit ("/home")
    create_list(:sector, 5)

    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    sector = Sector.first
    sector2 = Sector.last
    visit (sectors_path)
    
    expect(page).to have_content(sector.name)
    expect(page).to have_content(sector2.name)
  end
end