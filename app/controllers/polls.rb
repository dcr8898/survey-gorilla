get '/polls' do
  @surveys = Survey.all
  erb :'polls/index'
end

get '/polls/:id' do
  # Change user_id to session[:id] once it is implemented
  @poll = Poll.create(user_id: 14, survey_id: params[:id])
  @survey = Survey.find(params[:id])
  erb :'polls/show'
end

post '/polls' do
  poll = params[:response][:poll_id]
  choices = params[:response][:choices]
  @surveys = Survey.all
  # This is the poll id: 102 This is what is in choices: {"1"=>"4", "2"=>"7"}
  choices.values.each do |choice|
    Response.create(poll_id: poll, choice_id: choice)
  end
  erb :'polls/complete'

end
