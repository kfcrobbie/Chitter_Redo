require 'sinatra/base'

class Chitter < Sinatra::Base

get '/' do
	erb :'users/welcome_page'
end

post '/user' do 
	@current_user = params[:username]
  erb :'users/user'
	
end

post '/sign_up' do 
  erb :'users/sign_up'	
end


end
