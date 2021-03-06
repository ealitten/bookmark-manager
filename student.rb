require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'


class Student

  include DataMapper::Resource

  property :id, Serial
  property :name, String

end

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/database_play")
DataMapper.finalize
DataMapper.auto_upgrade!
