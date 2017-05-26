require 'rails_helper'

RSpec.feature "Sector", :type => :feature do
  scenario "User sees all tickers by sector" do
    user = create(:user)
    sector = create(:sector)
    create_list(:ticker, 5, sector_id: sector.id)
    ticker1 = Ticker.first
    ticker2 = Ticker.last

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    visit (sector_tickers_path(sector, sector.tickers))
    
    expect(page).to have_content(ticker1.symbol)
    expect(page).to have_content(ticker2.symbol)
  end
end