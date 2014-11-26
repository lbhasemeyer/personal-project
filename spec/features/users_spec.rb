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

  scenario "User creates a user - email already in use" do
    User.create!(
      first_name: "Peppe",
      last_name: "Lepeu",
      email: "paris@skunk.com",
      password: "macherie",
      )
    visit root_path
    click_on "Users"
    click_on "Create User"
    fill_in "First name", with: "Weird"
    fill_in "Last name", with: "Al"
    fill_in "Email", with: "paris@skunk.com"
    fill_in "Password", with: "sing"
    fill_in "Password confirmation", with: "sing"
    click_on "Add User"
    expect(page).to have_content("Email has already been taken")
  end

  scenario "User creates a user - fields corectly filled out" do
    visit root_path
    click_on "Users"
    expect(page).to have_no_content("Buffalo Bill")
    click_on "Create User"
    fill_in "First name", with: "Buffalo"
    fill_in "Last name", with: "Bill"
    fill_in "Email", with: "buffalo@bill.com"
    fill_in "Password", with: "yeehaw"
    fill_in "Password confirmation", with: "yeehaw"
    click_on "Add User"
    expect(page).to have_content("Buffalo Bill")
  end

  scenario "User signs in - fields blank" do
    User.create!(
      first_name: "Ms",
      last_name: "Frizzle",
      email: "magic@schoolbus.com",
      password: "iguana",
      )
      visit root_path
      click_on "Sign In"
      fill_in "Email", with: "magic@schhoolbus.com"
      fill_in "Password", with: "iguana"
      expect(page).to have_link("Public Map")
      expect(page).to have_link("Private Map")
      expect(page).to have_link("Sign Out")
  end

  scenario "User signs in - email and password don't match" do
  end

  scenario "User signs in - correct email and password" do
  end

  scenario "User signs in - email not case-sensitive" do
    User.create!(
      first_name: "Ms",
      last_name: "Frizzle",
      email: "magic@schoolbus.com",
      password: "iguana",
      )
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "MagIc@SchoOLbus.com"
    fill_in "Password", with: "iguana"
    click_button "Sign In"
    expect(page).to have_content("Public Map")
    expect(page).to have_content("Private Map")
    expect(page).to have_content("Sign Out")
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "MAGIC@SCHOOLBUS.com"
    fill_in "Password", with: "iguana"
    click_button "Sign In"
    expect(page).to have_link("Public Map")
    expect(page).to have_link("Private Map")
    expect(page).to have_link("Sign Out")
  end

end
