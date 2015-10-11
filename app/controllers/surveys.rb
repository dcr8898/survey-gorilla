get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'surveys/show'
end

get '/surveys/new' do
  @survey = Survey.new
  erb :'surveys/new'
end
