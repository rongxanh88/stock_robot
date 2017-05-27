require 'rails_helper'

RSpec.feature "Ticker", :type => :feature do
  scenario "User sees all tickers" do
    user = create(:user)
    create_list(:ticker, 5)
    ticker1 = Ticker.first
    ticker2 = Ticker.last

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    visit (tickers_path)
    
    expect(page).to have_content(ticker1.symbol)
    expect(page).to have_content(ticker2.symbol)
  end
end