require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String, required: true
  property :encrypted_password, Text
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  
  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

end