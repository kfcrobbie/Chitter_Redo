require 'bcrypt'
require 'data_mapper'
require 'dm-validations'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation


  property :id, Serial
  property :name, String, required: true
  property :username, String, unique: true, required: true 
  property :email, String, unique: true, required: true

  validates_confirmation_of :password, message: 'Sorry, your passwords do not match'

  property :password_digest, Text

  def self.authenticate(username,password)
    @user = User.first(username: username)
    if @user && BCrypt::Password.new(@user.password_digest) == password
      @user
    else
      nil
    end
  end



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
