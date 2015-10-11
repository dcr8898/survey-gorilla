get '/questions/:question_id/choices/new' do
  @question = Question.find_by(id: params[:question_id])
  @choice = Choice.new
  erb :'choices/new'
end

post '/questions/:question_id/choices' do
  @question = Question.find_by(id: params[:question_id])
  @choice = Choice.new(params[:choice])
  @choice.question_id = @question.id
  if @choice.save
    redirect "/questions/#{@question.id}/choices/new"
  else
    @errors = @choice.errors.full_messages
    erb :'choices/new'
  end
end
