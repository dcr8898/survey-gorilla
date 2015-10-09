class Question < ActiveRecord::Base
  has_many   :choices
  belongs_to :survey

  validates :survey_id, presence: true
  validates :text, presence: true, length: { maximum: 511 }
end
