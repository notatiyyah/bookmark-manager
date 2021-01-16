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
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get "/delete" do
    @delete = true
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/delete" do
    params.keys.each{ |name| Bookmark.delete(Bookmark.get_url(name)) }
    redirect "/bookmarks"
  end

  get "/add" do
    erb :add_form
  end

  post "/add" do
    Bookmark.new(params["url"], params["name"])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
