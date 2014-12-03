require 'rails_helper'

feature "signin" do
  before do
      user = User.create!(
        first_name: "Ms",
        last_name: "Frizzle",
        email: "magic@schoolbus.com",
        password: "iguana",
      )
  end

  scenario "User signs in - fields blank" do
      visit root_path
      click_on "Sign In"
      within '.well' do
        click_on "Sign In"
      end
      expect(page).to have_content("Username / password combination is invalid")
  end

  scenario "User signs in - email and password don't match" do
  end

  scenario "User signs in - correct email and password" do
      visit root_path
      click_on "Sign In"
      fill_in "Email", with: "magic@schoolbus.com"
      fill_in "Password", with: "iguana"
      within '.well' do
        click_on "Sign In"
      end
      expect(page).to have_no_content("Username / password combination is invalid")
      expect(page).to have_link("Public Map")
      expect(page).to have_link("Private Map")
      expect(page).to have_link("Sign Out")
  end
end
