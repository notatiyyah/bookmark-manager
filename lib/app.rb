require 'sinatra'
require 'sinatra/flash'
require 'sinatra/base'
require 'uri'
require_relative 'bookmark.rb'

class BookmarksApp < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get "/test" do
    'Testing infrastructure working!'
  end

  get "/" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get "/bookmarks/add" do
    erb :form
  end

  post "/bookmarks/add" do
    begin
      Bookmark.new(params["new_url"], params["new_title"])
    rescue RuntimeError
      flash[:notice] = "You must submit a valid URL."
    ensure
      redirect "/"
    end
  end

  post "/delete" do
    params.each{ |title, url| Bookmark.delete(url) }
    redirect "/"
  end

  get "/edit" do
    @url = params.values[0]
    @name = params.keys[0]
    erb :form
  end

  post "/edit" do
    begin
      Bookmark.update(params)
    rescue RuntimeError
      flash[:notice] = "You must submit a valid URL."
    ensure
      redirect "/"
    end
  end

  run! if app_file == $0
end
