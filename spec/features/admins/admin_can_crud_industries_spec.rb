require 'rails_helper'

RSpec.feature "industry", :type => :feature do

  before(:each) do
    @admin = create(:user, role: 1)

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: @admin.email_address
    fill_in "user[password]", with: @admin.password
    click_on "Login"
  end

  scenario "admin creates new industry type" do
    visit (console_path)

    click_on("Create Industry")
    fill_in "industry[name]", with: "Water Making"
    click_on("Create Industry")

    expect(page).to have_content("Water Making created!")
  end

  scenario "admin edits industry type" do
    industry = create(:industry)
    visit (industries_path)

    click_on("edit_industry_#{industry.id}")
    fill_in "industry[name]", with: "Basket Weaving"
    click_on("Update Industry")

    expect(page).to have_content("Basket Weaving")
    expect(page).to have_content("Basket Weaving updated!")
  end

  scenario "admin deletes industry type" do
    industry = create(:industry)
    visit (industries_path)
    expect(page).to have_content(industry.name)

    click_on "del_industry_#{industry.id}"

    expect(page).to have_content("#{industry.name} deleted!")
  end
end