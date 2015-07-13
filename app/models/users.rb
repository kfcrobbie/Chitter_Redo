require 'data_mapper'
require 'dm-validations'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true, message: 'Username already registered'
  property :email, String, unique: true, message: 'Email already registered'
  property :password, String

end
