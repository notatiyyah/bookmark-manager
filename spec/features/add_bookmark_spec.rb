require "spec_helper"

feature "add a bookmark" do

  scenario "submit new bookmark" do
    visit "/add-bookmark"
    fill_in "url", with: "https://bing.com"
    click_on "submit"
    expect(page).to have_content "https://bing.com"
  end

end