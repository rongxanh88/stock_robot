require 'rails_helper'

RSpec.feature "Sector", :type => :feature do

  before(:each) do
    @admin = create(:user, role: 1)

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: @admin.email_address
    fill_in "user[password]", with: @admin.password
    click_on "Login"
  end

  scenario "admin creates new sector type" do
    visit (console_path)

    click_on("Create Sector")
    fill_in "sector[name]", with: "Basket Weaving"
    click_on("Create Sector")

    expect(page).to have_content("Basket Weaving")
  end

  scenario "admin edits sector type" do
    sector = create(:sector)
    visit (sectors_path)

    click_on("edit_sector_#{sector.id}")
    fill_in "sector[name]", with: "Basket Weaving"
    click_on("Update Sector")

    expect(page).to have_content("Basket Weaving")
  end

  scenario "admin deletes sector type" do
    sector = create(:sector)
    visit (sectors_path)
    expect(page).to have_content(sector.name)

    click_on "del_sector_#{sector.id}"

    expect(page).not_to have_content(sector.name)
    expect(page).to have_content("Sector deleted!")
  end
end