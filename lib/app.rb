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

  get "/add-bookmark" do
    erb :add_form
  end

  post "/add-bookmark" do
    Bookmark.new(params["url"])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
