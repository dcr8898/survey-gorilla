class Poll < ActiveRecord::Base
  has_many   :responses
  belongs_to :survey
  belongs_to :user
  has_many   :questions, through: :survey
  has_many   :choices, through: :responses

  validates :user_id, presence: true
  validates :survey_id, presence: true
end
