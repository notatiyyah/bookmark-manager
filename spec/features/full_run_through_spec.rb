require "spec_helper"

feature "full runthrough"  do
  
  scenario "homepage, add new bookmark, delete bookmark" do
    visit "/"
    expect(page).to have_content "Makers"
    expect(page).to have_content "Google"
    expect(page).to have_content "Destroy All Software"
    click_on "add"
    fill_in "new_url", with: "https://www.twitch.tv"
    fill_in "new_title", with: "Twitch"  
    click_on "submit"
    expect(page).to have_content "Twitch"
    check "Twitch"
    click_on "update"
    fill_in "new_title", with: "not_twitch"  
    click_on "submit"
    check "not_twitch"
    click_on "delete"
    expect(page).not_to have_content "not_twitch"
  end

end