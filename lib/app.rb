require 'sinatra'
require 'sinatra/flash'
require 'sinatra/base'
require_relative 'bookmark.rb'
require_relative 'input_validation.rb'

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

  get "/bookmarks/:action" do
    if params[:action] == "edit"
      params.delete_if {|k,v| k == :action }
      @url = params.values[0]
      @name = params.keys[0]
    end
    erb :form
  end

  post "/bookmarks/:action" do
    begin
      InputVallidation.check_url(params["new_url"])
    rescue RuntimeError
      flash[:notice] = "You must submit a valid URL."
    else
      if params[:action] == "add"
        Bookmark.new(params["new_url"], params["new_title"])
      else
        Bookmark.update(params)
      end
    ensure
      redirect "/"
    end
  end

  post "/delete" do
    params.each{ |title, url| Bookmark.delete(url, title) }
    redirect "/"
  end

  run! if app_file == $0
end
