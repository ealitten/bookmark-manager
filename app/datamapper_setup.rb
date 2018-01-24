require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

require_relative 'models/tag'
require_relative 'models/bookmark'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
