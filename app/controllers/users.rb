get '/users/:id/edit' do
  @user = current_user

  if @user && (@user.id == params[:id].to_i)
    erb :'users/edit'
  else
    redirect '/surveys'
  end
end

get '/signup' do
  erb :'users/signup'
end

get '/login' do
  unless logged_in?
    erb :'users/login'
  else
    redirect '/surveys'
  end
end

get '/logout' do
  session.clear
  redirect '/surveys'
end

post '/login' do
  @user = User.find_by(username: params[:username])

  if @user.nil?
    @errors = ["Cannot find user #{params[:username]}."]
    erb :'users/login'
  elsif @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/surveys'
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
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/signup'
  end
end
