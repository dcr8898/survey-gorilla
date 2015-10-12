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

get '/surveys/:survey_id/questions/newx' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'questions/newx'
end

post '/surveys/:survey_id/questionsx' do
  survey_id = params[:survey_id]
  new_questions = params[:survey]
  new_questions.each_value do |question_hash|
    question = Question.create(survey_id: survey_id,
                               text: question_hash.delete('0'))
    question_hash.each_value do |choice_text|
      Choice.create(question_id: question.id, text: choice_text)
    end
  end
  redirect "/surveys/#{survey_id}/questions"
end
