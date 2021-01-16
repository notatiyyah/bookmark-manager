require "spec_helper"
require 'pg'

feature "bookmarks" do
	before do
		Bookmark.connect(true)
		visit "/"
	end

	scenario "view title" do
		expect(page).to have_content "Your Bookmarks"
	end

	scenario "view bookmarks" do
		expect(page).to have_content "Makers"
	end

end