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

  scenario "User can delete a tag" do
    ticker1 = create(:ticker, tag_list: "battery company")
    tag = Tag.first

    visit tags_path
    click_on "del_tag_#{tag.id}"
    visit ticker_path(ticker1)
    
    expect(page).not_to have_content("battery company")
  end
end