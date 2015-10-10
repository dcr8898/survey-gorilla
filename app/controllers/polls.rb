get '/polls' do
  @surveys = Survey.all
  erb :'polls/index'
end

get '/polls/:id' do
  # Note: This route assumes the user is logged in
  # Need to implement error handling for this route to function fully
  @poll = Poll.new(user_id: current_user.id, survey_id: params[:id])
  if @poll.save
    @survey = Survey.find(params[:id])
    erb :'polls/show'
  else
    @errors = @poll.errors.full_messages
    erb :'polls/index'
  end
end

post '/polls' do
  poll = params[:response][:poll_id]
  choices = params[:response][:choices]
  @surveys = Survey.all
  choices.values.each do |choice|
    Response.create(poll_id: poll, choice_id: choice)
  end
  erb :'polls/complete'

end

get '/surveys/:survey_id/polls' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/polls'
end
