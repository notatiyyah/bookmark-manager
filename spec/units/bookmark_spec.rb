require "bookmark.rb"
require "database_helper.rb"

describe Bookmark do
  let(:twitter) { Bookmark.new("https://twitter.com") }
  before do
    reset_db
    Bookmark.connect(true)
  end

  it "get bookmarks from database" do
    expect(Bookmark.all).to include("http://www.makersacademy.com")
    expect(Bookmark.all).to include("http://www.destroyallsoftware.com")
    expect(Bookmark.all).to include("https://google.com")
  end

	describe "initialization" do
		
		it "stores link" do
        expect(twitter.link).to eq "https://twitter.com"
    end

    it "adds self to list" do
      expect(Bookmark.all).to include(twitter)
    end

	end

end