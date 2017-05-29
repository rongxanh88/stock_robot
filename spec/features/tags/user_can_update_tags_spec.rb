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

  scenario "User can update a tag" do
    ticker1 = create(:ticker, tag_list: "battery company")
    ticker2 = create(:ticker, tag_list: "battery company")
    tag = Tag.first

    visit tags_path
    click_on "edit_tag_#{tag.id}"
    fill_in "tag[title]", with: "energizer"
    click_on "Update Tag"
    visit ticker_path(ticker1)
    
    expect(page).to have_content("energizer")
  end
end