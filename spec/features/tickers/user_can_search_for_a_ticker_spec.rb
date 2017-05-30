require 'rails_helper'

RSpec.feature "Ticker", :type => :feature do
  scenario "User can search for a ticker" do
    user = create(:user)
    create_list(:ticker, 100)
    ticker = Ticker.last

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"
    visit (tickers_path)
    
    fill_in "symbol", with: ticker.symbol
    click_on "Search"

    expect(page).to have_current_path(ticker_path(ticker))
  end
end