require 'sinatra/base'
require './app/models/bookmark'

class BookmarkManager < Sinatra::Base

  # start the server if ruby file executed directly
  run! if app_file == $0

  get '/links' do
    @bookmarks = Bookmark.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Bookmark.create(title: params[:title], url: params[:url] )
    redirect '/links'
  end


end
