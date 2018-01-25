ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'
require 'rake'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret,'3ba483fe8228a969accee0938e8c440abcf7891a06afcaa7f85b30a3bf7495e2c706826a9a97c920c9f5f6ec7d4481af7f8364c4d0006b3e1e571a7cf069d1e2'
  # start the server if ruby file executed directly
  run! if app_file == $0

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/links' do
    @bookmarks = Bookmark.all
    @current_user = current_user
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

  get '/users/new' do
    erb :registration
  end

  post '/users' do
    User.create(username: params[:username], password: params[:password])
    session[:user_id] = User.last.id
    redirect '/links'
  end

end
