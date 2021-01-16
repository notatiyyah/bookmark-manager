require "spec_helper"

feature "edit bookmarks" do
  before do
    visit "/"
  end

  scenario "submit new bookmark" do
    click_on "add"
    fill_in "new_url", with: "https://bing.com"
    fill_in "new_title", with: "Bing"
    click_on "submit"
    expect(page).to have_content "Bing"
    click_on "Bing"
  end

  scenario "delete bookmark" do
    check "Makers"
    click_on "delete"
    expect(page).not_to have_content "Makers"
  end

  scenario "update bookmark" do
    check "Makers"
    click_on "update"
    fill_in "new_title", with: "Bing"
    click_on "submit"
    expect(page).not_to have_content "Makers"
    expect(page).to have_content "Bing"
  end

end