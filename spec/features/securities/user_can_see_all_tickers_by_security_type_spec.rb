require 'rails_helper'

RSpec.feature "Security", :type => :feature do
  scenario "User sees all tickers by security type" do
    user = create(:user)
    security = create(:security)
    create_list(:ticker, 5, security_id: security.id)

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    ticker = Ticker.first
    ticker2 = Ticker.last
    visit (security_tickers_path(security, security.tickers))
    
    expect(page).to have_content(ticker.symbol)
    expect(page).to have_content(ticker2.symbol)
  end
end