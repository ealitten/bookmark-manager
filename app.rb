require 'sinatra/base'
require './app/models/bookmark'

class BookmarkManager < Sinatra::Base

  # start the server if ruby file executed directly
  run! if app_file == $0

  get '/' do
   "Hello world"
  end

end
