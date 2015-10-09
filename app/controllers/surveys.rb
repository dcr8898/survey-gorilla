get '/surveys' do
  @surveys = Survey.all
end
