require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

DataMapper::Logger.new($stdout, :debug)

class Student

  include DataMapper::Resource

  property :id, Serial
  property :name, String

end