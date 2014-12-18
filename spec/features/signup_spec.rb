require 'rails_helper'

feature "signup" do
  scenario "User signs up - fields blank" do
    visit root_path
    click_on "Sign Up"
    within '.well' do
      click_button "Sign Up"
    end
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "User signs up - fields complete" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Steve"
    fill_in "Last name", with: "Irwin"
    fill_in "Email", with: "croc@hunter.com"
    fill_in "Password", with: "danger"
    fill_in "Password confirmation", with: "danger"
    within '.well' do
      click_button "Sign Up"
    end
    expect(page).to have_link("Public Map")
    expect(page).to have_link("Private Map")
    expect(page).to have_link("Sign Out")
  end
end
