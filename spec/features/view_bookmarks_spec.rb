require "spec_helper"

feature "view bookmarks" do
	before do
		visit "/bookmarks"
	end

	scenario "view title" do
		expect(page).to have_content "Your Bookmarks"
	end

	scenario "view pre loaded bookmarks" do
		expect(page).to have_content "https://thoughtbot.com/upcase/test-driven-rails-resources/capybara.pdf"
		expect(page).to have_content "https://github.com/makersacademy"
	end

end