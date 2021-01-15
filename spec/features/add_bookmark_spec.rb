require "spec_helper"
require "database_helper.rb"

feature "add a bookmark" do
  before do
    reset_db
    Bookmark.connect(true)
  end

  scenario "submit new bookmark" do
    visit "/add-bookmark"
    fill_in "url", with: "https://bing.com"
    fill_in "name", with: "Bing"
    click_on "submit"
    expect(page).to have_content "Bing"
    click_on "Bing"
  end

end