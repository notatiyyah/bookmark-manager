require 'sinatra/base'

class BookmarksApp < Sinatra::Base

  get "/test" do
    'Testing infrastructure working!'
  end

  get "/" do
    erb :index
  end

  run! if app_file == $0
end
