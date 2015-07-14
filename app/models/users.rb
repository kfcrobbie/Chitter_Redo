require 'bcrypt'
require 'data_mapper'
require 'dm-validations'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation


  property :id, Serial
  property :name, String
  property :username, String, unique: true, message: 'Username already registered'
  property :email, String, unique: true, required: true, message: 'Email already registered'

  validates_confirmation_of :password, message: 'Sorry, your passwords do not match'

  property :password_digest, Text

  def self.authenticate(username,password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
