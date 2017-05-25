require 'rails_helper'

RSpec.feature "Industry", :type => :feature do
  scenario "User sees all tickers from industry" do
    user = create(:user)
    industry = create(:industry)
    create_list(:ticker, 10, industry_id: industry.id)
    visit ("/home")
    
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    visit (industry_tickers_path(industry, industry.tickers))
    # expect(page).to have_content(industry.name)
  end
end