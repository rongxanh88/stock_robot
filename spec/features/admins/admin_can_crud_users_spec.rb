require 'rails_helper'

RSpec.feature "Security", :type => :feature do

  before(:each) do
    @admin = create(:user, role: 1)
    @user = create(:user, email_address: "hankypanky@gmail.com")

    visit ("/home")
    click_on("Login")
    fill_in "user[email_address]", with: @admin.email_address
    fill_in "user[password]", with: @admin.password
    click_on "Login"
  end

  scenario "admin edits user" do
    visit (console_path)

    click_on("edit_user_#{@user.id}")
    fill_in "user[email_address]", with: "Bond007@gmail.com"
    fill_in "user[password]", with: "noPassword"
    choose "user_role_admin"
    click_on("Update Account")

    expect(page).to have_content("Bond007@gmail.com")
  end

  scenario "admin deletes user" do
    visit (console_path)

    click_on "del_user_#{@user.id}"

    expect(page).not_to have_content("hankypanky@gmail.com")
    expect(page).to have_content("User Deleted!")
  end
end