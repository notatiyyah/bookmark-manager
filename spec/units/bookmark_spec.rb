require "bookmark.rb"
require "spec_helper.rb"

describe Bookmark do
  let(:twitter) { "https://twitter.com" }
  before do
    Bookmark.new(twitter, "Twitter")
  end

  it "get bookmarks from database" do
    bookmark_urls = Bookmark.all.map{|b| b.url }
    expect(bookmark_urls).to include("http://www.makersacademy.com")
    expect(bookmark_urls).to include("http://www.destroyallsoftware.com")
    expect(bookmark_urls).to include("https://google.com")
  end

  it "adds self to db" do
    bookmark_urls = Bookmark.all.map{|b| b.url }
    expect(bookmark_urls).to include(twitter)
  end

  it "deletes 'twitter' from database" do
    Bookmark.delete([twitter])
    bookmark_urls = Bookmark.all.map{|b| b.url }
    expect(bookmark_urls).not_to include(twitter)
  end

  describe "get url" do

    it "gets url from bookmark title" do
      expect(Bookmark.get_url("Twitter")).to include(twitter)
    end

    it "can return multiple urls with same title" do
      Bookmark.new("http://google.com", "Twitter")
      expect(Bookmark.get_url("Twitter")).to include("http://google.com", twitter)
    end

    it "returns empty array if no urls" do
      expect(Bookmark.get_url("this-doesnt-exist")).to be_empty
    end


  end
end