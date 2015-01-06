require 'rails_helper'

feature "users" do
  before do
    User.create!(
    first_name: "Peppe",
    last_name: "Lepeu",
    email: "paris@skunk.com",
    admin: true,
    password: "macherie",
    password_confirmation: "macherie"
    )
    User.create!(
    first_name: "Aaron",
    last_name: "Carter",
    email: "aaron@carter.com",
    admin: false,
    password: "sing",
    password_confirmation: "sing",
    )
  end

  scenario "Admin creates a user - blank fields" do
      visit root_path
      click_on "Sign In"
      fill_in "Email", with: "paris@skunk.com"
      fill_in "Password", with: "macherie"
      within '.well' do
        click_button "Sign In"
      end
      click_on "Users"
      click_on "Create User"
      click_button "Create User"
      expect(page).to have_content("First name can't be blank")
      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
  end

  scenario "Admin creates a user - passwords don't match" do
      visit root_path
      click_on "Sign In"
      fill_in "Email", with: "paris@skunk.com"
      fill_in "Password", with: "macherie"
      within '.well' do
        click_button "Sign In"
      end
      click_on "Users"
      click_on "Create User"
      fill_in "First name", with: "Ron"
      fill_in "Last name", with: "Burgundy"
      fill_in "Email", with: "anchor@man.com"
      fill_in "Password", with: "sandiego"
      fill_in "Password confirmation", with: "whale"
      click_button "Create User"
      expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "Admin creates a user - email already in use" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "paris@skunk.com"
    fill_in "Password", with: "macherie"
    within '.well' do
      click_button "Sign In"
    end
    click_on "Users"
    click_on "Create User"
    fill_in "First name", with: "Weird"
    fill_in "Last name", with: "Al"
    fill_in "Email", with: "paris@skunk.com"
    fill_in "Password", with: "sing"
    fill_in "Password confirmation", with: "sing"
    click_button "Create User"
    expect(page).to have_content("Email has already been taken")
  end

  scenario "Admin creates a user - fields corectly filled out" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "paris@skunk.com"
    fill_in "Password", with: "macherie"
    within '.well' do
      click_button "Sign In"
    end
    click_on "Users"
    expect(page).to have_no_content("Buffalo Bill")
    click_on "Create User"
    fill_in "First name", with: "Buffalo"
    fill_in "Last name", with: "Bill"
    fill_in "Email", with: "buffalo@bill.com"
    fill_in "Password", with: "yeehaw"
    fill_in "Password confirmation", with: "yeehaw"
    click_button "Create User"
    expect(page).to have_content("Buffalo Bill")
  end

  scenario "Admin edits a user" do
    User.create!(
      first_name: "Galileo",
      last_name: "Galilei",
      email: "look@up.com",
      password: "science"
    )
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "paris@skunk.com"
    fill_in "Password", with: "macherie"
    within '.well' do
      click_button "Sign In"
    end
    visit users_path
    expect(page).to have_content("Galileo Galilei")
    find(:xpath, "//tr[contains(.,'Galileo')]/td/a", :text => 'Edit').click
    fill_in "First name", with: "Barney"
    fill_in "Last name", with: "Fife"
    fill_in "Email", with: "someday@sheriff.com"
    click_button "Update User"
    expect(page).to have_no_content("Galileo Galilei")
    expect(page).to have_content("Barney Fife")
    expect(page).to have_content("someday@sheriff.com")
  end

  scenario "Admin deletes a user" do
    User.create!(
      first_name: "Jimi",
      last_name: "Hendrix",
      email: "johnny@hendrix.com",
      password: "guitar"
    )
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "paris@skunk.com"
    fill_in "Password", with: "macherie"
    within '.well' do
      click_button "Sign In"
    end
    visit users_path
    expect(page).to have_content("Jimi Hendrix")
    find(:xpath, "//tr[contains(.,'Jimi')]/td/a", :text => 'Delete').click
    expect(page).to have_no_content("Jimi Hendrix")
  end

  scenario "When admin clicks on user name goes to that user's show page" do
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "paris@skunk.com"
    fill_in "Password", with: "macherie"
    within '.well' do
      click_button "Sign In"
    end
    visit users_path
    expect(page).to have_content("Aaron Carter")
    click_on "Aaron Carter"
    expect(page).to have_content("Aaron Carter")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end

end
