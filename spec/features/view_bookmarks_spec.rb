require "spec_helper"
require 'pg'

feature "view bookmarks" do
	before do
		visit "/bookmarks"
	end

	scenario "view title" do
		expect(page).to have_content "Your Bookmarks"
	end

end