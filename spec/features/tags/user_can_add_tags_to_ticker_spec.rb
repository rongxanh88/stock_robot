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
    expect(page).to have_content("ruby on rails")
  end

  scenario "User can create multiple tags for a ticker" do
    ticker = create(:ticker)

    visit (ticker_path(ticker))
    fill_in "ticker[tag_list]", with: "hot company, bull run, must buy"
    click_on("Update Ticker")

    expect(page). to have_content("hot company, bull run, must buy")
  end

  scenario "user can remove tags from a ticker" do
    ticker = create(:ticker)
    ticker.update_attributes(tag_list: "hot company")
    
    visit (ticker_path(ticker))
    expect(page).to have_content("hot company")

    fill_in "ticker[tag_list]", with: ""
    click_on("Update Ticker")

    expect(page).not_to have_content("hot company")
  end
end