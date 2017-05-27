require 'rails_helper'

RSpec.feature "Trading Data", :type => :feature do
  scenario "User sees trading data for a ticker" do
    user = create(:user)
    ticker = create(:ticker)
    data = create(:trading_data, ticker_id: ticker.id)

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: user.email_address
    fill_in "user[password]", with: user.password
    click_on "Login"

    visit (ticker_path(ticker))
    
    expect(page).to have_content(ticker.symbol)
    expect(page).to have_content("Open")
  end
end