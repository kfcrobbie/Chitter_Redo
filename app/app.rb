require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'users/welcome_page'
  end

  post '/user' do
    session[:user] = params[:username]
    @current_user = session[:user]
    erb :'users/user'
  end

  get '/user' do
    "Success!"
    erb :'users/user'
  end

  post '/sign_up' do
    erb :'users/sign_up'
  end

  post '/user/new' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        username: params[:username],
                        password: params[:password])
    if @user.save
      session[:user] = @user.username
      @current_user = session[:user]
      redirect to('/user')
    else
      @user.errors.each do |e|
        puts e
      end

    end
  end
end
