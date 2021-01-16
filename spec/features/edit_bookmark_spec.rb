require "spec_helper"

feature "edit bookmarks" do

  scenario "submit new bookmark" do
    visit "/add"
    fill_in "url", with: "https://bing.com"
    fill_in "name", with: "Bing"
    click_on "submit"
    expect(page).to have_content "Bing"
    click_on "Bing"
  end

  scenario "delete bookmark" do
    visit "/delete"
    expect(page).to have_content "Mark the bookmarks you would like to delete"
    check "Makers"
    click_on "Submit"
    expect(page).not_to have_content "Makers"
  end

end