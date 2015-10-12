class Survey < ActiveRecord::Base
  has_many   :questions
  has_many   :polls
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }

  def nice_date
    self.created_at.localtime.strftime("%B %-d, %Y")
  end

  def owner
    self.user.username
  end

  def question_count
    self.questions.count
  end

  def poll_count
    self.polls.count
  end

  def results
    self.questions.each_with_object({}) do |question, survey_results|
      survey_results[question.text] = question.choices.map.with_object({}) do |choice, data_hash|
        data_hash[choice.text] = choice.responses.count
      end
    end
  end

end
