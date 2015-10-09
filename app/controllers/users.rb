get '/signup' do
  # if user is logged in, redirect, else
  erb :'users/signup'
end
