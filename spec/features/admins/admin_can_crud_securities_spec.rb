require 'rails_helper'

RSpec.feature "Security", :type => :feature do

  before(:each) do
    @admin = create(:user, role: 1)
    @security1 = create(:security)
    @security2 = create(:security, security_type: "ETF")

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: @admin.email_address
    fill_in "user[password]", with: @admin.password
    click_on "Login"
  end

  scenario "admin creates new security type" do
    visit (console_path)

    click_on("Create Security Type")
    fill_in "security[security_type]", with: "Bond"
    click_on("Create Security")

    expect(page).to have_content(@security1.security_type)
    expect(page).to have_content(@security2.security_type)
    expect(page).to have_content("Bond")
  end

  scenario "admin edits security type" do
    visit (securities_path)

    click_on("edit_security_#{@security2.id}")
    fill_in "security[security_type]", with: "Bond"
    click_on("Update Security")

    expect(page).to have_content("Bond")
  end

  scenario "admin deletes security type" do
    visit (securities_path)

    click_on "del_security_#{@security2.id}"

    expect(page).not_to have_content("ETF")
    expect(page).to have_content("Security Type Deleted!")
  end
end