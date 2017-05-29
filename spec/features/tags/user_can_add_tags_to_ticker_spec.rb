require 'rails_helper'

RSpec.feature "Tag", :type => :feature do

  before(:each) do
    @user = create(:user)

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: @user.email_address
    fill_in "user[password]", with: @user.password
    click_on "Login"
  end

  scenario "User can create a single tag for a ticker" do
    ticker = create(:ticker)

    visit (ticker_path(ticker))
    
    fill_in "ticker[tag_list]", with: "ruby on rails"
    click_on("Update Ticker")

    expect(page).to have_current_path(ticker_path(ticker))
    expect(page).to have_content("Tag(s) created!")
  end
end