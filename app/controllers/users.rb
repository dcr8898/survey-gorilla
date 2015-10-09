get '/signup' do
  # if user is logged in, redirect, else
  erb :'users/signup'
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
