require "bookmark.rb"
require "database_helper.rb"

describe Bookmark do
  let(:twitter) { "https://twitter.com" }
  before do
    reset_db
    Bookmark.connect(true)
  end

  it "get bookmarks from database" do
    bookmark_urls = Bookmark.all.map{|b| b.url }
    expect(bookmark_urls).to include("http://www.makersacademy.com")
    expect(bookmark_urls).to include("http://www.destroyallsoftware.com")
    expect(bookmark_urls).to include("https://google.com")
  end

	describe "initialization" do

    it "adds self to db" do
      tw_bm = Bookmark.new(twitter, "Twitter")
      bookmark_urls = Bookmark.all.map{|b| b.url }
      expect(bookmark_urls).to include(twitter)
    end

  end
  
  it "deletes 'twitter' from database" do
    tw_bm = Bookmark.new(twitter, "Twitter")
    Bookmark.delete(tw_bm)
    bookmark_urls = Bookmark.all.map{|b| b.url }
    expect(bookmark_urls).not_to include(twitter)
  end

end