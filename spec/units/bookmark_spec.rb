require "./lib/bookmark.rb"

describe Bookmark do
  let(:google) { Bookmark.new("https://google.com") }

  it "can pre load links" do
    Bookmark.pre_load
    expect(Bookmark.all_links).to include("https://thoughtbot.com/upcase/test-driven-rails-resources/capybara.pdf")
		expect(Bookmark.all_links).to include("https://github.com/makersacademy")
  end

	describe "initialization" do
		
		it "stores link" do
        expect(google.link).to eq "https://google.com"
    end

    it "adds self to list" do
      expect(Bookmark.all).to include(google)
    end

	end

end