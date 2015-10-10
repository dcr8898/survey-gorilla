class Response < ActiveRecord::Base
  belongs_to :poll
  belongs_to :choice

  validates :poll_id, presence: true
  validates :choice_id, presence: true

  def question
    self.choice.question.text
  end

  def text
    self.choice.text
  end

  def question_choices
    self.choice.question.choices
  end
end
