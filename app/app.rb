ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class BookmarkManager < Sinatra::Base

  # start the server if ruby file executed directly
  run! if app_file == $0

  get '/' do
    erb :index
  end

  get '/links' do
    @bookmarks = Bookmark.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    bookmark = Bookmark.new(title: params[:title], url: params[:url] )
    tags = params[:tags].split(',').map(&:strip)
    tags.each { |tag| bookmark.tags << Tag.first_or_create(name: tag) }
    bookmark.save
    redirect '/links'
  end

  get '/tags/:name' do
    @bookmarks = Bookmark.all(Bookmark.tags.name => params[:name])
    erb :'links/index'
  end

end
