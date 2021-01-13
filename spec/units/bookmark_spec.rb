require "./lib/bookmark.rb"

describe Bookmark do
  let(:google) { Bookmark.new("https://google.com") }

  it "get bookmarks from database" do
    expect(Bookmark.all).to include("http://www.makersacademy.com")
    expect(Bookmark.all).to include("http://www.destroyallsoftware.com")
    expect(Bookmark.all).to include("http://google.com")
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