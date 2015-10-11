users = Array.new(100) { "#{Faker::Name.first_name}_#{Faker::Name.last_name}"}.uniq

50.times do |i|
  User.create(username:      users[i],
              password: users[i])
end

survey = Survey.create(user_id: User.first.id,
                       name:    "DBC Feedback")

question1 = Question.create(survey_id: survey.id,
                           text:      "How much do you love DBC?")

choices = ["A lot",
           "A whole lot",
           "A super-duper-lot",
           "Around the moon and back again"]

choices.each do |choice|
  Choice.create(question_id: question1.id,
                text: choice)
end

question2 = Question.create(survey_id: survey.id,
                           text:      "How awesome is this?")

choices = ["A lot",
           "A whole lot",
           "A super-duper-lot",
           "Around the moon and back again"]

choices.each do |choice|
  Choice.create(question_id: question2.id,
                text: choice)
end


100.times do |i|
  poll = Poll.create(user_id:    User.ids.sample,
                     survey_id:  survey.id,
                     created_at: Faker::Time.backward(60))

  Response.create(poll_id: poll.id,
                choice_id: Choice.ids.sample)
end
