get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

post '/surveys' do
  @survey = Survey.new(params[:survey])
  @survey.user_id = current_user.id
  if @survey.save
    if params[:js]
      redirect "/surveys/#{@survey.id}/questions/newx"
    else
      redirect "/surveys/#{@survey.id}/questions/new"
    end
  else
    @errors = @survey.errors.full_messages
    erb :'surveys/new'
  end
end

get '/surveys/new' do
  @survey = Survey.new
  erb :'surveys/new'
end

get '/surveys/:survey_id/results' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/results'
end

get '/surveys/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/show'
end
