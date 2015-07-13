require 'sinatra/base'

class Chitter < Sinatra::Base

get '/' do
	erb :'users/welcome_page'
end





end
