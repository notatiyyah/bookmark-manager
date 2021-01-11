require 'sinatra/base'
require_relative 'bookmark.rb'

class BookmarksApp < Sinatra::Base

  get "/test" do
    'Testing infrastructure working!'
  end

  get "/" do
    erb :index
  end

  get "/bookmarks" do
    Bookmark.pre_load
    @bookmarks = Bookmark.all_links
    erb :bookmarks
  end

  run! if app_file == $0
end
