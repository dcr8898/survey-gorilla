get '/signup' do
  erb :'users/signup'
end

get '/login' do
  erb :'users/login'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  @user = User.find_by(username: params[:username])

  if @user.nil?
    @errors = ["Cannot find user #{params[:username]}."]
    erb :'users/login'
  elsif @user.password == params[:password]
    session[:user_id] == @user.id
    redirect '/'
  else
    @errors = ["Incorrect password."]
    erb :'users/login'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/signup'
  end
end
