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

  it "raises error if not valid url" do
    expect {Bookmark.new("not-valid-url", "invalid_bm")}.to raise_error "Not a valid URL"
  end

  it "deletes 'twitter' from database" do
    Bookmark.delete(twitter)
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

  describe "get title" do

    it "gets url from bookmark title" do
      expect(Bookmark.get_title(twitter)).to include("Twitter")
    end

    it "returns empty array if no urls" do
      expect(Bookmark.get_url("this-doesnt-exist")).to be_empty
    end

  end

  describe "update" do
    let(:params) {{
      "original_url" => "https://www.twitch.tv",
      "original_title" => "Twitch",
      "new_url" => "https://www.twitch.tv",
      "new_title" =>  "Twitch"
    }}
    
    it "update url" do
      Bookmark.new("https://wwf.twitch.tv", "Twitch")
      params["original_url"] = "https://wwf.twitch.tv"
      Bookmark.update(params)
      expect(Bookmark.get_url("Twitch")).to eq ["https://www.twitch.tv"]
    end

    it "update title" do
      Bookmark.new("https://www.twitch.tv", "Tvitch")
      params["original_title"] = "Tvitch"
      Bookmark.update(params)
      expect(Bookmark.get_title("https://www.twitch.tv")).to eq ["Twitch"]
    end

    it "update url & title" do
      Bookmark.new("https://wwf.twitch.tv", "Tvitch")
      params["original_url"] = "https://wwf.twitch.tv"
      params["original_title"] = "Tvitch"
      Bookmark.update(params)
      amended_bm = Bookmark.all[-1]
      expect(amended_bm.alias).to eq "Twitch"
      expect(amended_bm.url).to eq "https://www.twitch.tv"
    end

  end

end