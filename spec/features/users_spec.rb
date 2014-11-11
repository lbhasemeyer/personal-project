require 'rails_helper'

feature "users" do

  scenario "User creates a user - blank fields" do
      visit root_path
      click_on "Users"
      click_on "Create User"
      click_on "Add User"
      save_and_open_page
      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
  end

  scenario "User creates a user - passwords don't match" do
      visit root_path
  end

end
