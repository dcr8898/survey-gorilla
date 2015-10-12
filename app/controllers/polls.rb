get '/polls' do
  @polls = Poll.all
  erb :'polls/index'
end

get '/polls/new' do
  @surveys = Survey.all
  if request.xhr?
    erb :'polls/new', layout: false
  else
    erb :'polls/new'
  end
end

get'/polls/:poll_id/responses' do |id|
  @poll = Poll.find(id)
  erb :'polls/show'
end

get '/surveys/:survey_id/polls' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/polls'
end

# Need to implement error handling on surveys/index route
# for this route to function fully
get '/surveys/:survey_id/polls/new' do
  @poll = Poll.new(user_id: current_user.id, survey_id: params[:survey_id])
  if @poll.save
    erb :'polls/new_specific'
  else
    @errors = @poll.errors.full_messages
    erb :'surveys/index'
  end
end

post '/surveys/:survey_id/polls' do
  @poll = Poll.find(params[:response][:poll_id])
  choices = params[:response][:choices]
  choices.values.each do |choice|
    Response.create(poll_id: @poll.id, choice_id: choice)
  end
  
  if request.xhr?
    erb :'polls/show', layout: false
  else  
    redirect "/polls/#{@poll.id}/responses"
  end
end

get '/polls/:id' do
  @poll = Poll.find(params[:id])
  erb :'polls/show'
end
