get '/polls' do
  @surveys = Survey.all
  erb :'polls/index'
end

get '/polls/:id' do
  @poll = Poll.new(user_id: session[:id], survey_id: params[:id])
  @survey = Survey.find(params[:id])
  erb :'polls/show'
end

post '/polls' do


end
