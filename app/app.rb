require 'sinatra/base'

class Chitter < Sinatra::Base

get '/' do
	erb :'users/welcome_page'
end

post '/user' do 
  @user = User.create(name: params[:name], 
              email: params[:email], 
              username: params[:username],
              password: params[:password])
  if @user.save
    @current_user = @user.username
    redirect to('/user')
  else
    @user.errors.each do |e|
      puts e
    end
    erb :'users/user'
  end
end
  
  get '/user' do 
    "Success!"
    erb :'users/user'
  end
	

post '/sign_up' do 
  erb :'users/sign_up'	
end


end
