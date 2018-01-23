require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'


class Bookmark

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
