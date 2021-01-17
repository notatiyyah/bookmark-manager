require "spec_helper.rb"

feature "user validation" do
  
  scenario "checks if the url is valid" do
    visit "/"
    click_on "add"
    fill_in "new_url", with: "not-a-real-url"
    fill_in "new_title", with: "invalid bookmark"
    click_on "submit"
    expect(page).not_to have_content "invalid bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end

  scenario "checks if the url is valid" do
    visit "/"
    click_on "Makers"
    click_on "update"
    fill_in "new_url", with: "not-a-real-url"
    click_on "submit"
    expect(page).to have_content "You must submit a valid URL."
  end

end