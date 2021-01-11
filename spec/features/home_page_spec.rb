require "spec_helper"

feature "render home page" do
    before do
        visit "/"
    end

    scenario "view title" do
        expect(page).to have_content "Bookmarks Manager"
    end

end