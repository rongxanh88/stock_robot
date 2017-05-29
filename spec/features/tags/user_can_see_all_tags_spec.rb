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

  scenario "User can see all tags" do
    create_list(:tag, 10)
    tag1 = Tag.first
    tag2 = Tag.last

    visit tags_path
    
    expect(page).to have_current_path(tags_path)
    expect(page).to have_content(tag1.title)
    expect(page).to have_content(tag2.title)
  end

  scenario "User can see all tickers with that tag" do
    ticker1 = create(:ticker, tag_list: "battery company")
    ticker2 = create(:ticker, tag_list: "battery company")

    visit tags_path

    click_on("battery company")

    expect(page).to have_content(ticker1.symbol)
    expect(page).to have_content(ticker2.symbol)
  end
end