get '/questions/:question_id/choices/new' do
  @question = Question.find_by(id: params[:question_id])
  @choice = Choice.new
  erb :'choices/new'
end
