require 'sinatra/base'
require_relative 'bookmark.rb'

class BookmarksApp < Sinatra::Base

  get "/test" do
    'Testing infrastructure working!'
  end

  get "/" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/delete" do
    params.each{ |title, url| Bookmark.delete(url) }
    redirect "/"
  end

  get "/add" do
    erb :form
  end

  post "/add" do
    Bookmark.new(params["new_url"], params["new_title"])
    redirect "/"
  end

  get "/edit" do
    @url = params.values[0]
    @name = params.keys[0]
    erb :form
  end

  post "/edit" do
    Bookmark.update(params)
    redirect "/"
  end

  run! if app_file == $0
end
