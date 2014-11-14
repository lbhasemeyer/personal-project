require 'rails_helper'

feature "users" do

  scenario "User creates a user - blank fields" do
      visit root_path
      click_on "Users"
      click_on "Create User"
      click_on "Add User"
      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
  end

  scenario "User creates a user - passwords don't match" do
      visit root_path
      click_on "Users"
      click_on "Create User"
      fill_in "First name", with: "Ron"
      fill_in "Last name", with: "Burgundy"
      fill_in "Email", with: "anchor@man.com"
      fill_in "Password", with: "sandiego"
      fill_in "Password confirmation", with: "whale"
      click_on "Add User"
      expect(page).to have_content("Password confirmation doesn't match Password")
  end

end
