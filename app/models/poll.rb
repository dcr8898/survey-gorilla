class Poll < ActiveRecord::Base
  has_many   :responses
  belongs_to :survey
  belongs_to :user
  has_many   :questions, through: :survey
  has_many   :choices, through: :responses

  validates :user_id, presence: true
  validates :survey_id, presence: true

  def nice_date
    self.created_at.localtime.strftime("%B %-d, %Y")
  end

  def taker
    self.user.username
  end

  def survey_name
    self.survey.name
  end

  def questions
    self.survey.questions
  end
end
