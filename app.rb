require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base 

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do 
    erb :"bookmarks/new"
  end

  post '/bookmarks' do 
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do 
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

run! if app_file == $0
end