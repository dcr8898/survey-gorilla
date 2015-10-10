get '/surveys/:survey_id/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/questions'
end
