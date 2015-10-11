get '/surveys/:survey_id/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/questions'
end

get '/surveys/:survey_id/questions/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.new
  erb :'questions/new'
end

post '/surveys/:survey_id/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.new(params[:question])
  @question.survey_id = @survey.id
  if @question.save
    redirect "/questions/#{@question.id}/choices/new"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

