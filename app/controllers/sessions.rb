class Chitter < Sinatra::Base

  get '/sessions/new' do
    @user = User.get(session[:user_id])
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
    else
      p "AUTH ERROR"
    end
    redirect to('/')
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/'
  end
  
end
