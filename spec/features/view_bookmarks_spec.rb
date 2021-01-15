require "spec_helper"
require 'pg'

feature "view bookmarks" do
	before do
		Bookmark.connect(true)
		visit "/bookmarks"
	end

	scenario "view title" do
		expect(page).to have_content "Your Bookmarks"
	end

	scenario "view bookmarks" do
		expect(page).to have_content "http://www.makersacademy.com"
	end

end