class SessionController < ApplicationController

  get '/registrations/signup' do

    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], username: params["username"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/login'
  end
  
  get '/login' do
       erb :'session/login'  
     end

    post '/login' do
      
            @user = User.find_by(username:params[:username])
            if @user && @user.authenticate(params[:password]) 
                session[:user_id] = @user.id
                redirect '/orders'
            else
                 redirect '/login'
            end        
    end

    get '/logout' do
      session.clear
      redirect to "/login"
    end
end