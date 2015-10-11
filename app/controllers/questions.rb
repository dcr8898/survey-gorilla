get '/surveys/:survey_id/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/questions'
end

get '/surveys/:survey_id/questions/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.new
  erb :'questions/new'
end
