require "spec_helper"

feature "full runthrough"  do
  
  scenario "homepage, add new bookmark, delete bookmark" do
    visit "/"
    expect(page).to have_content "Makers"
    expect(page).to have_content "Google"
    expect(page).to have_content "Destroy All Software"
    click_on "Add Bookmark"
    fill_in "url", with: "https://www.twitch.tv"
    fill_in "name", with: "Twitch"  
    click_on "submit"
    expect(page).to have_content "Twitch"
    click_on "Delete Bookmark"
    check "Twitch"
    click_on "Submit"
    expect(page).not_to have_content "Twitch"
  end

end